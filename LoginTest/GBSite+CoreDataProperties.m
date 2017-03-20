//
//  GBSite+CoreDataProperties.m
//  LoginTest
//
//  Created by Mac on 3/20/17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

#import "GBSite+CoreDataProperties.h"

@implementation GBSite (CoreDataProperties)

+ (NSFetchRequest<GBSite *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"GBSite"];
}

@dynamic siteID;
@dynamic siteName;
@dynamic page;

@end
