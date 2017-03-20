//
//  GBKeyWord+CoreDataProperties.m
//  LoginTest
//
//  Created by Mac on 3/20/17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

#import "GBKeyWord+CoreDataProperties.h"

@implementation GBKeyWord (CoreDataProperties)

+ (NSFetchRequest<GBKeyWord *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"GBKeyWord"];
}

@dynamic keyWord;
@dynamic keyWordID;
@dynamic personID;
@dynamic person;
@dynamic rank;

@end
