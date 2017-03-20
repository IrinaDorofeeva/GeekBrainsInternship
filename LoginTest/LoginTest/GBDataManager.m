//
//  GBDataManager.m
//  LoginTest
//
//  Created by Mac on 3/18/17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

#import "GBDataManager.h"
#import "GBPerson+CoreDataClass.h"
#import "GBSite+CoreDataClass.h"
#import "GBPage+CoreDataClass.h"
#import "GBKeyWord+CoreDataClass.h"
#import "GBRank+CoreDataClass.h"



static NSString* personNames[] = {
    @"Tramp", @"Putin", @"Medvedev"};

static NSString* siteNames[] = {
    @"lenta.tu", @"rbc.ru", @"cnn.com"};

static NSString* personKeyWords[] = {
    @"TrampWord", @"PutinWord", @"MedvedevWord"};

static NSString* pageURL[] = {
    @"lenta.tu/Page", @"rbc.ru/Page", @"cnn.com/Page"};






@implementation GBDataManager


@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;




+ (GBDataManager*) sharedManager {
    
    static GBDataManager* manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GBDataManager alloc] init];
    });
    
    return manager;
}

//methods for adding fake data to database


//adding 3 persons each had 1 keyword and adding 3 sites each has 1 page
//adding ranks (9 total)


- (void) addData {
    
    for (int i = 0; i<3; i++){
        GBPerson* person =
        [NSEntityDescription insertNewObjectForEntityForName:@"GBPerson"
                                      inManagedObjectContext:self.managedObjectContext];
        person.personName = personNames[i];
        [person.managedObjectContext save:nil];
        GBKeyWord* personKeyWord =
        [NSEntityDescription insertNewObjectForEntityForName:@"GBKeyWord"
                                      inManagedObjectContext:self.managedObjectContext];
        personKeyWord.keyWord = personKeyWords[i];
        [person.managedObjectContext save:nil];
        [personKeyWord.managedObjectContext save:nil];
    
        
        for (int j = 0; j<3; j++)
        {
            GBSite* site =
            [NSEntityDescription insertNewObjectForEntityForName:@"GBSite"
                                          inManagedObjectContext:self.managedObjectContext];
            site.siteName = siteNames[j];
            [site.managedObjectContext save:nil];
            
            GBPage* page =
            [NSEntityDescription insertNewObjectForEntityForName:@"GBPage"
                                          inManagedObjectContext:self.managedObjectContext];
            page.pageURL = pageURL[j];
            [page.managedObjectContext save:nil];
            
            
            GBRank* gRank = [NSEntityDescription insertNewObjectForEntityForName:@"GBRank"
                                                         inManagedObjectContext:self.managedObjectContext];
            gRank.rank=i+j;
            //arc4random();
            gRank.page=page;
            gRank.keyWord=personKeyWord;
            
            NSLog(@"rank is %d for %@ for %@",gRank.rank, personKeyWord.keyWord, page.pageURL);
            
            [gRank.managedObjectContext save:nil];
        }
    }
    
}
-(void) printData{

    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription* description =
    [NSEntityDescription entityForName:@"GBRank"
                inManagedObjectContext:self.managedObjectContext];
    
    [request setEntity:description];
    
    NSError* requestError = nil;
    NSArray* resultArray = [self.managedObjectContext executeFetchRequest:request error:&requestError];
    if (requestError) {
        NSLog(@"%@", [requestError localizedDescription]);
    }
    
     NSLog(@"print ready");
    
    for (GBRank* object in resultArray){
    
        GBRank* rank = (GBRank*) object;
        NSLog(@"RANK: %hd, FOR KEYWORD: %@ ON PAGE %@", rank.rank, rank.keyWord.keyWord, rank.page.pageURL);
    
    }
}


- (void) deleteData {
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription* description =
    [NSEntityDescription entityForName:@"GBRank"
                inManagedObjectContext:self.managedObjectContext];
    
    [request setEntity:description];
    
    NSError* requestError = nil;
    NSArray* resultArray = [self.managedObjectContext executeFetchRequest:request error:&requestError];
    if (requestError) {
        NSLog(@"%@", [requestError localizedDescription]);
    }
    
    for (id object in resultArray) {
        [self.managedObjectContext deleteObject:object];
    }
    [self.managedObjectContext save:nil];
}




- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            
           
            
        }
    }
}



#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType: NSMainQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"GBInternship" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"GBInternship.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        
        [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil];
        
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}




    @end
   

