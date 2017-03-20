//
//  GBGeneralStatisticsViewController.m
//  LoginTest
//
//  Created by Mac on 3/18/17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

#import "GBGeneralStatisticsViewController.h"
#import "GBPerson+CoreDataProperties.h"

@interface GBGeneralStatisticsViewController ()

@end

@implementation GBGeneralStatisticsViewController

@synthesize fetchedResultsController = _fetchedResultsController;



- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription* description =
    [NSEntityDescription entityForName:@"GBPerson"
                inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:description];
    
    NSSortDescriptor* nameDescription =
    [[NSSortDescriptor alloc] initWithKey:@"personName" ascending:YES];
    
    [fetchRequest setSortDescriptors:@[nameDescription]];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:self.managedObjectContext
                                          sectionNameKeyPath:nil
                                                   cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _fetchedResultsController;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription* description =
    [NSEntityDescription entityForName:@"GBPerson"
                inManagedObjectContext:self.managedObjectContext];
    
    [request setEntity:description];
    
    NSError* requestError = nil;
    
    NSArray* resultArray = [self.managedObjectContext executeFetchRequest:request error:&requestError];
    if (requestError) {
        NSLog(@"%@", [requestError localizedDescription]);
    }
    
    _personsArray=resultArray;
    
    
    //NSLog(@"Model is %@", context.persistentStoreCoordinator.managedObjectModel)
   
   //for (id object in  _personsArray) {
        
     //     GBPerson* person = (GBPerson*) object;
       //     NSLog(@"Person: %@", person.personName);
       // }
    
    
    GBPerson* person = (GBPerson*) _personsArray[1];
    
    NSLog(@"Person: %@", person.personName);
    // NSLog(@"Person: %@", _personsNames[1].personName);
    // Do any additional setup after loading the view.
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return _personsArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    
    GBPerson* person = (GBPerson*) _personsArray[row];
    
    return person.personName;
} 



#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
   // float rate = [_exchangeRates[row] floatValue];
    //float dollars = [_dollarText.text floatValue];
    //float result = dollars * rate;
    
    GBPerson* person = (GBPerson*) _personsArray[row];
    NSString *resultString = [[NSString alloc] initWithFormat:
                              @"%@",
                              person.personName];
 
    _personPickedLabel.text = resultString;
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
