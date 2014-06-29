/* Sort array *********************************************************************************** */

// Sort array of objects by field "balance" and get top5
NSSortDescriptor *sortDescriptor;
sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"balance" ascending:NO];
accounts = (NSMutableArray *)[[accounts sortedArrayUsingDescriptors:[NSMutableArray arrayWithObject:sortDescriptor]]
                              subarrayWithRange:NSRangeFromString(@"{0,5}")];

// Reverse array
array = (NSMutableArray *)[[array reverseObjectEnumerator] allObjects];