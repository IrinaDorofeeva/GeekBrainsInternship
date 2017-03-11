//
//  SiSRegistrationViewController.m
//  LoginTest
//
//  Created by Mac on 3/10/17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

#import "SiSRegistrationViewController.h"
#import "SiSLoginViewController.h"
#import "SiSStatisticsViewController.h"

@interface SiSRegistrationViewController ()

@end

@implementation SiSRegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _usernameFld.delegate = self;
    _passwordFld.delegate = self;
    _reEnterPasswordFld.delegate =self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



 //Register user
- (IBAction)registerUser:(id)sender {
    
    //Check for full fields and show alert
    if ([self.usernameFld.text isEqualToString:@""] || [self.passwordFld.text isEqualToString:@""]) {
     
     UIAlertController* error = [UIAlertController alertControllerWithTitle:@"Oooops" message:@"You must complete all fields" preferredStyle:UIAlertControllerStyleAlert];
     
     UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"ОК"
     style:UIAlertActionStyleDefault
     handler:^(UIAlertAction * _Nonnull action) {
     
     [self dismissViewControllerAnimated:YES completion:nil];
     
     }];
     
     [error addAction:okAction];
     
     [self presentViewController:error animated:YES completion:nil];
     
     } else {
     
     //Check password and re-Enter password fields
     [self checkPasswordsMatch];
     }
}


- (void) checkPasswordsMatch {
    
    if ([self.passwordFld.text isEqualToString:self.reEnterPasswordFld.text]) {
     NSLog(@"passwords match!");
     [self registerNewUser];
     
     } else {
     
     NSLog(@"passwords don't match");
     UIAlertController* error = [UIAlertController alertControllerWithTitle:@"Oooops" message:@"Your entered passwords do not match" preferredStyle:UIAlertControllerStyleAlert];
     UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"ОК"
     style:UIAlertActionStyleDefault
     handler:^(UIAlertAction * _Nonnull action) {
     
     [self dismissViewControllerAnimated:YES completion:nil];
     
     }];
     
     
     [error addAction:okAction];
     
     
     
     [self presentViewController:error animated:YES completion:nil];
     
     }
}


- (void) registerNewUser {
    
     NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
     
     [defaults setObject:self.usernameFld.text forKey:@"username"];
     [defaults setObject:self.passwordFld.text forKey:@"password"];
     [defaults setBool:YES forKey:@"registered"];
     
     [defaults synchronize];
     
     UIAlertController* success = [UIAlertController alertControllerWithTitle:@"Success" message:@"You have registered a new user" preferredStyle:UIAlertControllerStyleAlert];
     UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"ОК"
     style:UIAlertActionStyleDefault
     handler:^(UIAlertAction * _Nonnull action) {
         
     
     [self openStatisticsView];
         
     }];
     
     [success addAction:okAction];
     
     [self presentViewController:success animated:YES completion:nil];

}


- (void) openStatisticsView {
    
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SiSStatisticsViewController* vc = [sb instantiateViewControllerWithIdentifier:@"SiSStatisticsNavigationController"];
    [self presentViewController:vc animated:YES completion:nil];
}



#pragma mark - UITextFieldDelegate


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark - keyboard movements


- (void)keyboardWillShow:(NSNotification *)notification
{
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = self.view.frame;
        f.origin.y = -keyboardSize.height;
        self.view.frame = f;
    }];
}

-(void)keyboardWillHide:(NSNotification *)notification
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = self.view.frame;
        f.origin.y = 0.0f;
        self.view.frame = f;
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
