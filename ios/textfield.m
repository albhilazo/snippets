[[NSNotificationCenter defaultCenter] addObserver:self
                                         selector:@selector(exampleTextFieldDidChange:)
                                             name:UITextFieldTextDidChangeNotification
                                           object:outletExampleTextField];


/**
 * Called when outletExampleTextField changes
 */
- (void)exampleTextFieldDidChange:(NSNotification *)notification
{
	// Actions on change
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}