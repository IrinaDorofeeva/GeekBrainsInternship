//
//  SiSLoginViewController.m
//  LoginTest
//
//  Created by Stanly Shiyanovskiy on 05.03.17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

#import "SiSLoginViewController.h"

@interface SiSLoginViewController () 

@end

@implementation SiSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    if (![defaults boolForKey:@"registered"]) {
        NSLog(@"No user registered");
        self.loginBtn.hidden = YES;

    } else {
        
        NSLog(@"user is registered");
        self.reEnterPasswordFld.hidden = YES;
        self.registerBtn.hidden = YES;
    }

}

-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
}

#pragma mark - Actions

- (IBAction)registerUser:(id)sender {
    
    if ([self.usernameFld.text isEqualToString:@""] || [self.passwordFld.text isEqualToString:@""]) {
        
        UIAlertController* error = [UIAlertController alertControllerWithTitle:@"Oooops" message:@"You must complete all fields" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"ОК"
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * _Nonnull action) {
                                                               
                                                               [self dismissViewControllerAnimated:YES completion:nil];
                                                               
                                                           }];
        
        [error addAction:okAction];
        
        [self presentViewController:error animated:YES completion:nil];
    }
}

- (IBAction)loginUser:(id)sender {
    
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    if ([textField isEqual:self.usernameFld]) {
        [self.passwordFld becomeFirstResponder];
    } else if ([textField isEqual:self.passwordFld] && !self.registerBtn.hidden) {
        [self.reEnterPasswordFld becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    
}









@end
