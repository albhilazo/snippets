[self performSegueWithIdentifier:@"nextViewSegue"
                          sender:object];

// Return to previous view
[self dismissViewControllerAnimated:YES completion:nil];

// Return to root view
[self.navigationController popToRootViewControllerAnimated:YES];




/* Required methods ***************************************************************************** */

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"nextViewSegue"]) {
        NextViewController *nextView = [segue destinationViewController];
        nextView.propertyNextView = sender;
    }
}




/* Delegate back data *************************************************************************** */

/* SecondViewController.h */
@protocol ModalViewDelegate;

@property (nonatomic, assign) id delegate;
@property Object *objectToSendBack;


/* SecondViewController.m */
@synthesize delegate;

// Submit
[delegate didSubmit:self.objectToSendBack];
[self dismissViewControllerAnimated:YES completion:nil];


/* FirstViewController.h */
@protocol ModalViewDelegate
- (void)didSubmit:(Object *)object;
@end

<ModalViewDelegate>


/* FirstViewController.m */
SecondViewController *secondView = [segue destinationViewController];
secondView.objectToSendBack = sender;
secondView.delegate = self;

- (void)didSubmit:(Object *)object
{
    // Actions with object
}