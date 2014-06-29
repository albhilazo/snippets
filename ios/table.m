// Assign delegate and datasource to controller

// Controller protocols
<UITableViewDelegate, UITableViewDataSource>




/* Required methods ***************************************************************************** */

/**
 * TableView required method
 * Informs the table view how many rows are in the section
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
    //return [sourceArray count];
}


/**
 * TableView required method
 * Called every time a table row is displayed
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
        // cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        // cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //                      UITableViewCellAccessoryDetailButton
        //                      UITableViewCellAccessoryCheckmark
    }

    /* With button:
    UIButton *cellButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cellButton.frame = CGRectMake(200.0f, 5.0f, 75.0f, 30.0f);
    cellButton.tag = indexPath.row;
    [cellButton setTitle:@"Edit" forState:UIControlStateNormal];
    [cell addSubview:cellButton];
    [cellButton addTarget:self
                   action:@selector(editItem:)
         forControlEvents:UIControlEventTouchUpInside];
    */

    cell.textLabel.text = [NSString stringWithFormat:@"%d", (int)indexPath.row];
    // cell.detailTextLabel.text = [NSString stringWithFormat:@"Foo bar"];
    // cell.imageView.image = [UIImage imageNamed:@"image.png"];
    
    return cell;
}




/* Other methods ******************************************************************************** */

/**
 * Called when a table cell is selected
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
	// Action on select
}


/**
 * Called when touching the Edit button in a table cell
 */
- (IBAction)editItem:(id)sender
{
    // We previously set the UIButton tag as its index
    editIndex = [sender tag];
    [self performSegueWithIdentifier:@"editViewSegue"
                              sender:[sourceArray objectAtIndex:editIndex]];
}


/**
 * Determines for which rows the delete gesture is enabled
 */
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // All rows
    return UITableViewCellEditingStyleDelete;
    //     UITableViewCellEditingStyleInsert
    //     UITableViewCellEditingStyleNone
}


/**
 * Called when touching the Delete button
 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [sourceArray removeObjectAtIndex:indexPath.row];
    
    // Update table
    [outletTableView reloadData];
}




/* Programmaticaly refresh ********************************************************************** */

[outletTableView reloadData];




/* Pull to refresh ****************************************************************************** */

// Interface variable
UIRefreshControl *refreshControl;

// viewDidLoad
refreshControl = [[UIRefreshControl alloc]init];
[contactsTableView addSubview:refreshControl];
[refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];

- (void)refreshTable
{
    // Refresh table data

    [refreshControl endRefreshing];
}