/* Search in array ****************************************************************************** */

NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"(itemAttr1 contains[c] %@) OR (itemAttr2 contains[c] %@)", searchText, searchText];
searchResults = (NSMutableArray *)[sourceArray filteredArrayUsingPredicate:resultPredicate];




/* SearchBar with TableView ********************************************************************* */

// Controller protocols
<UISearchBarDelegate>

// Interface variables
NSMutableArray *searchResults;
BOOL withSearch;

// viewDidLoad
withSearch = NO;

// numberOfRowsInSection
if (withSearch) {
    return [searchResults count];
} else {
    return [sourceArray count];
}

// cellForRowAtIndexPath
if (withSearch) {
    item = (Item *)[searchResults objectAtIndex:indexPath.row];
} else {
    item = (Item *)[sourceArray objectAtIndex:indexPath.row];
}

// didSelectRowAtIndexPath
if (withSearch) {
    [self performSegueWithIdentifier:@"itemDetailSegue"
                              sender:[searchResults objectAtIndex:indexPath.row]];
} else {
    [self performSegueWithIdentifier:@"itemDetailSegue"
                              sender:[sourceArray objectAtIndex:indexPath.row]];
}


/**
 * Called when the search string changes
 */
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"(itemAttr1 contains[c] %@) OR (itemAttr2 contains[c] %@)", searchText, searchText];
    searchResults = (NSMutableArray *)[sourceArray filteredArrayUsingPredicate:resultPredicate];
    
    if ([searchResults count] > 0) {
        withSearch = YES;
    } else {
        withSearch = NO;
    }
    
    [outletTableView reloadData];
}