//
//  GBPage+CoreDataProperties.h
//  LoginTest
//
//  Created by Mac on 3/20/17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

#import "GBPage+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GBPage (CoreDataProperties)

+ (NSFetchRequest<GBPage *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *foundDateTime;
@property (nullable, nonatomic, copy) NSDate *lastScanDateTime;
@property (nonatomic) int16_t pageID;
@property (nullable, nonatomic, copy) NSString *pageURL;
@property (nonatomic) int16_t siteID;
@property (nullable, nonatomic, retain) NSSet<GBRank *> *rank;
@property (nullable, nonatomic, retain) GBSite *site;

@end

@interface GBPage (CoreDataGeneratedAccessors)

- (void)addRankObject:(GBRank *)value;
- (void)removeRankObject:(GBRank *)value;
- (void)addRank:(NSSet<GBRank *> *)values;
- (void)removeRank:(NSSet<GBRank *> *)values;

@end

NS_ASSUME_NONNULL_END
