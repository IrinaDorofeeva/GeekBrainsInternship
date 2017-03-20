//
//  GBPerson+CoreDataProperties.m
//  LoginTest
//
//  Created by Mac on 3/20/17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

#import "GBPerson+CoreDataProperties.h"

@implementation GBPerson (CoreDataProperties)

+ (NSFetchRequest<GBPerson *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"GBPerson"];
}

@dynamic personID;
@dynamic personName;
@dynamic keyWord;

@end
