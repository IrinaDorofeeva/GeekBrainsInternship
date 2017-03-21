//
//  GBGeneralStatisticsViewController.m
//  LoginTest
//
//  Created by Mac on 3/18/17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

#import "GBGeneralStatisticsViewController.h"
#import "GBPerson+CoreDataProperties.h"
#import "GBSite+CoreDataProperties.h"
#import "GBRank+CoreDataProperties.h"
#import "GBKeyWord+CoreDataProperties.h"
#import "GBPage+CoreDataProperties.h"



@interface GBGeneralStatisticsViewController ()

#define sitePicker 0
#define personPicker 1

@end

@implementation GBGeneralStatisticsViewController

@synthesize fetchedResultsController = _fetchedResultsController;



/*- (NSFetchedResultsController *)fetchedResultsController
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
}*/


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //getting data from data base
    
NSFetchRequest* request = [[NSFetchRequest alloc] init];
    NSEntityDescription* description =
    [NSEntityDescription entityForName:@"GBPerson"
                inManagedObjectContext:self.managedObjectContext];
    [request setEntity:description];
    NSError* requestError = nil;
    _personsArray = [self.managedObjectContext executeFetchRequest:request error:&requestError];
    if (requestError) {
        NSLog(@"%@", [requestError localizedDescription]);
    }
    
    
    description =
    [NSEntityDescription entityForName:@"GBSite"
                inManagedObjectContext:self.managedObjectContext];
    [request setEntity:description];
    requestError = nil;
    _sitesArray = [self.managedObjectContext executeFetchRequest:request error:&requestError];
    if (requestError) {
        NSLog(@"%@", [requestError localizedDescription]);
    }
    
    
    description =
    [NSEntityDescription entityForName:@"GBRank"
                inManagedObjectContext:self.managedObjectContext];
    [request setEntity:description];
    requestError = nil;
    _ranksArray = [self.managedObjectContext executeFetchRequest:request error:&requestError];
    if (requestError) {
        NSLog(@"%@", [requestError localizedDescription]);
    }
    
    
  /*  NSPredicate* predicate = [NSPredicate predicateWithFormat:@"rank.page.pageURL == %@", _sitePickedLabel];
    [request setPredicate:predicate];
    requestError = nil;
    _filteredRanksArray = [self.managedObjectContext executeFetchRequest:request error:&requestError];
    if (requestError) {
        NSLog(@"%@", [requestError localizedDescription]);
    }

    NSLog(@"filteres array size %d",_filteredRanksArray.count);*/

}
-(void) updateRankArray{
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];

    [request setEntity:[NSEntityDescription entityForName:@"GBRank"
                                   inManagedObjectContext:self.managedObjectContext]];
    NSError* requestError = nil;
    
    
    [request setPredicate:[NSPredicate predicateWithFormat:@"page.pageURL ==  %@",_sitePickedLabel.text ]];
    //[request setPredicate:[NSPredicate predicateWithFormat:@"keyWord.keyWord ==  %@",_personPickedLabel.text ]];
    
   // [request setPredicate:[NSPredicate predicateWithFormat:@"page.pageURL ==  %@ AND  keyWord.keyWord ==  %@",_sitePickedLabel.text,_personPickedLabel.text ]];
   
    
    //[request setPredicate: [NSPredicate predicateWithFormat:@"SUBQUERY(rank, $rank, $rank.page.pageURL == %@)", @"rbc.ru"]];
    
    _filteredRanksArray = [self.managedObjectContext executeFetchRequest:request error:&requestError];
    if (requestError) {
        NSLog(@"%@", [requestError localizedDescription]);
    }
    
    NSLog(@"filteres array size %d",_filteredRanksArray.count);


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
    int count;
    if(pickerView.tag == sitePicker)
    {
        count =_sitesArray.count;
        
    }
    else if (pickerView.tag == personPicker)
    {
        count = _personsArray.count;
    }
return count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    NSString* stringInPicker;
    
    if(pickerView.tag == sitePicker)
    {
        GBSite* site = (GBSite*) _sitesArray[row];
        
        stringInPicker = site.siteName;
        
    }
    else if (pickerView.tag == personPicker)
    {
        GBPerson* person = (GBPerson*) _personsArray[row];
        stringInPicker =person.personName;
    }
    return stringInPicker;
} 



#pragma mark PickerView Delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
   // float rate = [_exchangeRates[row] floatValue];
    //float dollars = [_dollarText.text floatValue];
    //float result = dollars * rate;
    if(pickerView.tag == personPicker)
    {
    GBPerson* person = (GBPerson*) _personsArray[row];
    NSString *resultString = [[NSString alloc] initWithFormat:
                              @"%@",
                              person.personName];
 
    _personPickedLabel.text = resultString;
        
        [self updateRankArray];
        [_ranksTable reloadData];
    }
    else if(pickerView.tag == sitePicker){
        
        GBSite* site = (GBSite*) _sitesArray[row];
        NSString *resultString = [[NSString alloc] initWithFormat:
                                  @"%@",
                                  site.siteName];
        
        _sitePickedLabel.text = resultString;
        [self updateRankArray];
        [_ranksTable reloadData];
    
    
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog( @"%d", _filteredRanksArray.count);
    return _filteredRanksArray.count;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    GBRank* rank = (GBRank*) _filteredRanksArray[indexPath.row];
    //NSString *resultString = [[NSString alloc] initWithFormat:
      //                        @"%@",
        //                      site.siteName];
    
   // Music *obj = [arrData objectAtindex:indexPath.row];
    cell.textLabel.text = [[NSString alloc] initWithFormat:
                                                  @"%hd is for %@ on %@",rank.rank, rank.keyWord.keyWord, rank.page.pageURL];
    // Configure the cell...
    // cell.textLabel.text = @"*******************************";
    return cell;
}






#pragma mark - Fetched results controller

/*

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}
*/
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
