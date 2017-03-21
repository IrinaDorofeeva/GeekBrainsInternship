//
//  GBGeneralStatisticsViewController.h
//  LoginTest
//
//  Created by Mac on 3/18/17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBCoreDataViewController.h"


@interface GBGeneralStatisticsViewController : GBCoreDataViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) NSArray *personsArray;
@property (strong, nonatomic) NSArray *sitesArray;
@property (strong, nonatomic) NSArray *ranksArray;
@property (strong, nonatomic) NSArray *filteredRanksArray;

@property (weak, nonatomic) IBOutlet UITextField *pickedSiteTextField;

@property (weak, nonatomic) IBOutlet UIPickerView *personPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *sitePicker;
@property (weak, nonatomic) IBOutlet UITableView *ranksTable;
@end
