//
//  User.h
//  twitter
//
//  Created by Rigre Reinier Garciandia Larquin on 6/28/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, strong) NSString *profilePicture;
@property (nonatomic, strong) NSString *bannerPicture;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *userDescription;
@property (nonatomic) BOOL verified;
@property (nonatomic) NSInteger followersCount;
@property (nonatomic) NSInteger followingCount;
@property (nonatomic) NSInteger tweetsCount;


//initializer with dictionary
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
