//
//  GBPerson+CoreDataProperties.h
//  LoginTest
//
//  Created by Mac on 3/20/17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

#import "GBPerson+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GBPerson (CoreDataProperties)

+ (NSFetchRequest<GBPerson *> *)fetchRequest;

@property (nonatomic) int16_t personID;
@property (nullable, nonatomic, copy) NSString *personName;
@property (nullable, nonatomic, retain) NSSet<GBKeyWord *> *keyWord;

@end

@interface GBPerson (CoreDataGeneratedAccessors)

- (void)addKeyWordObject:(GBKeyWord *)value;
- (void)removeKeyWordObject:(GBKeyWord *)value;
- (void)addKeyWord:(NSSet<GBKeyWord *> *)values;
- (void)removeKeyWord:(NSSet<GBKeyWord *> *)values;

@end

NS_ASSUME_NONNULL_END
