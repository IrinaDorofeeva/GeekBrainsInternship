//
//  GBGeneralStatisticsViewController.h
//  LoginTest
//
//  Created by Mac on 3/18/17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBCoreDataViewController.h"


@interface GBGeneralStatisticsViewController : GBCoreDataViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (strong, nonatomic) NSArray *personsArray;
//@property (weak, nonatomic) IBOutlet UIPickerView *GBPersonGSOutlet;
@property (weak, nonatomic) IBOutlet UIPickerView *personPicker;
@property (weak, nonatomic) IBOutlet UILabel *personPickedLabel;

@end
