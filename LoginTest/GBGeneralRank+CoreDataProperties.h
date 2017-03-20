//
//  GBGeneralRank+CoreDataProperties.h
//  LoginTest
//
//  Created by Mac on 3/20/17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "GBGeneralRank+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GBGeneralRank (CoreDataProperties)

+ (NSFetchRequest<GBGeneralRank *> *)fetchRequest;

@property (nonatomic) int16_t rank;
@property (nullable, nonatomic, retain) GBSite *site;
@property (nullable, nonatomic, retain) GBPerson *person;

@end

NS_ASSUME_NONNULL_END
