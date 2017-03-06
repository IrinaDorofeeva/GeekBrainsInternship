//
//  SiSLoginSuccessfully.m
//  LoginTest
//
//  Created by Stanly Shiyanovskiy on 06.03.17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

#import "SiSLoginSuccessfully.h"

@interface SiSLoginSuccessfully ()

@end

@implementation SiSLoginSuccessfully

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)logoutAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
