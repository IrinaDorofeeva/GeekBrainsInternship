//
//  SiSLoginViewController.h
//  LoginTest
//
//  Created by Stanly Shiyanovskiy on 05.03.17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SiSLoginViewController : UIViewController <UITextFieldDelegate>





@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UITextField *usernameFld;


@property (weak, nonatomic) IBOutlet UITextField *passwordFld;


- (IBAction)loginUser:(id)sender;

- (void) openStatisticsView;



@end
