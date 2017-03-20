//
//  GBUser+CoreDataProperties.h
//  LoginTest
//
//  Created by Mac on 3/20/17.
//  Copyright © 2017 Stanly Shiyanovskiy. All rights reserved.
//

#import "GBUser+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GBUser (CoreDataProperties)

+ (NSFetchRequest<GBUser *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *loginName;
@property (nullable, nonatomic, copy) NSString *password;
@property (nonatomic) int16_t userID;

@end

NS_ASSUME_NONNULL_END
