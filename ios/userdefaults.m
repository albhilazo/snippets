// Save user preferences and other data (session)

/* Save ***************************************************************************************** */

NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
[userDefaults setObject:accountName forKey:@"account"];
[userDefaults setInteger:defaultColorInteger forKey:@"colorPreference"];




/* Load ***************************************************************************************** */

NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
NSString *accountName   = [userDefaults objectForKey:@"account"];
int defaultColorInteger = [userDefaults integerForKey:@"colorPreference"];




/* Clear **************************************************************************************** */

[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"account"];




/* Force sync *********************************************************************************** */

// Automatically invoked at periodic intervals, but can be called after
//   applying changes if it won't create unnecessary overhead.
[[NSUserDefaults standardDefaults] synchronize];