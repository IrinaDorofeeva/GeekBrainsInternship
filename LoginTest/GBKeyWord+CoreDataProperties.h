//
//  GBKeyWord+CoreDataProperties.h
//  LoginTest
//
//  Created by Mac on 3/20/17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

#import "GBKeyWord+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GBKeyWord (CoreDataProperties)

+ (NSFetchRequest<GBKeyWord *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *keyWord;
@property (nonatomic) int16_t keyWordID;
@property (nonatomic) int16_t personID;
@property (nullable, nonatomic, retain) GBPerson *person;
@property (nullable, nonatomic, retain) NSSet<GBRank *> *rank;

@end

@interface GBKeyWord (CoreDataGeneratedAccessors)

- (void)addRankObject:(GBRank *)value;
- (void)removeRankObject:(GBRank *)value;
- (void)addRank:(NSSet<GBRank *> *)values;
- (void)removeRank:(NSSet<GBRank *> *)values;

@end

NS_ASSUME_NONNULL_END
