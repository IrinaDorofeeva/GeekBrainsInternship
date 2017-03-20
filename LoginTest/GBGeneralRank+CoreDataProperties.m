//
//  GBGeneralRank+CoreDataProperties.m
//  LoginTest
//
//  Created by Mac on 3/20/17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "GBGeneralRank+CoreDataProperties.h"

@implementation GBGeneralRank (CoreDataProperties)

+ (NSFetchRequest<GBGeneralRank *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"GBGeneralRank"];
}

@dynamic rank;
@dynamic site;
@dynamic person;

@end
