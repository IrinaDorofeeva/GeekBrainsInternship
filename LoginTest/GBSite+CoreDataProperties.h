//
//  GBSite+CoreDataProperties.h
//  LoginTest
//
//  Created by Mac on 3/20/17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

#import "GBSite+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GBSite (CoreDataProperties)

+ (NSFetchRequest<GBSite *> *)fetchRequest;

@property (nonatomic) int16_t siteID;
@property (nullable, nonatomic, copy) NSString *siteName;
@property (nullable, nonatomic, retain) NSSet<GBPage *> *page;

@end

@interface GBSite (CoreDataGeneratedAccessors)

- (void)addPageObject:(GBPage *)value;
- (void)removePageObject:(GBPage *)value;
- (void)addPage:(NSSet<GBPage *> *)values;
- (void)removePage:(NSSet<GBPage *> *)values;

@end

NS_ASSUME_NONNULL_END
