//
//  GBPage+CoreDataProperties.m
//  LoginTest
//
//  Created by Mac on 3/20/17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

#import "GBPage+CoreDataProperties.h"

@implementation GBPage (CoreDataProperties)

+ (NSFetchRequest<GBPage *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"GBPage"];
}

@dynamic foundDateTime;
@dynamic lastScanDateTime;
@dynamic pageID;
@dynamic pageURL;
@dynamic siteID;
@dynamic rank;
@dynamic site;

@end
