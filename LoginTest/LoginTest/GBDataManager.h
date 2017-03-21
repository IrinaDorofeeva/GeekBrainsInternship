//
//  GBDataManager.h
//  LoginTest
//
//  Created by Mac on 3/18/17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface GBDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext* managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel* managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator* persistentStoreCoordinator;

- (void)saveContext;
//- (NSURL *)applicationDocumentsDirectory;

+ (GBDataManager*) sharedManager;

- (void) addData;
- (void) printData;
- (void) deleteData;
- (NSArray*) allObjects;
- (NSArray*) oneClass: (NSString*) entityName;

@end
