//
//  GBRank+CoreDataProperties.h
//  LoginTest
//
//  Created by Mac on 3/20/17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

#import "GBRank+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GBRank (CoreDataProperties)

+ (NSFetchRequest<GBRank *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *dateOfScan;
@property (nonatomic) int16_t keyWordID;
@property (nonatomic) int16_t pageID;
@property (nonatomic) int16_t rank;
@property (nullable, nonatomic, retain) GBKeyWord *keyWord;
@property (nullable, nonatomic, retain) GBPage *page;

@end

NS_ASSUME_NONNULL_END
