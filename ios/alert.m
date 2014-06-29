[self popAlertWithTitle:@"Done"
                Message:@"Operation successful"
            ButtonTitle:@"Ok"
                 andTag:1];

/**
 * Creates and shows a new alert view
 */
- (void)popAlertWithTitle:(NSString *)title
                  Message:(NSString *)message
              ButtonTitle:(NSString *)buttonTitle
                   andTag:(NSInteger)tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:buttonTitle
                                              otherButtonTitles: nil];
    // [alertView addButtonWithTitle:@"Button"];
    alertView.alertViewStyle = UIAlertViewStyleDefault;
    //                         UIAlertViewStylePlainTextInput
    //                         UIAlertViewStyleSecureTextInput
    //                         UIAlertViewStyleLoginAndPasswordInput
    alertView.tag = tag;
    [alertView show];
}




/**
 * Called after alert is dismissed
 */
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0 && alertView.tag == 1) {
        // Button actions
        /* If has TextFields:
        string = [alertView textFieldAtIndex:0].text;
        */
    }

    // Any other button will simply dismiss the alert
}