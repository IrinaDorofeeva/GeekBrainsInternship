//
//  GBRank+CoreDataProperties.m
//  LoginTest
//
//  Created by Mac on 3/20/17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

#import "GBRank+CoreDataProperties.h"

@implementation GBRank (CoreDataProperties)

+ (NSFetchRequest<GBRank *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"GBRank"];
}

@dynamic dateOfScan;
@dynamic keyWordID;
@dynamic pageID;
@dynamic rank;
@dynamic keyWord;
@dynamic page;

@end
