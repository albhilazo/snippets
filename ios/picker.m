// Assign delegate and datasource to controller

// Controller protocols
<UIPickerViewDataSource, UIPickerViewDelegate>




/* Get selected row index *********************************************************************** */

[categoryTransactionPickerView selectedRowInComponent:0];




/* Required methods ***************************************************************************** */

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    // One column
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    // Set number of rows
    return [sourceArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    // Set item per row
    return [NSString stringWithFormat:@"%@", sourceArray[row]];
}




/* Other methods ******************************************************************************** */

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // Actions on select
}




/* Programmaticaly refresh ********************************************************************** */

[outletPickerView reloadAllComponents];