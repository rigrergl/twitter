//
//  User.m
//  twitter
//
//  Created by Rigre Reinier Garciandia Larquin on 6/28/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        self.profilePicture = dictionary[@"profile_image_url_https"];
        self.bannerPicture = dictionary[@"profile_banner_url"];
        self.location = dictionary[@"location"];
        self.userDescription = dictionary[@"description"];
        self.verified = [dictionary[@"verified"] boolValue];
        self.followersCount = (NSNumber *)dictionary[@"followers_count"];
        self.followingCount = (NSNumber *)dictionary[@"friends_count"];
        self.tweetsCount = (NSNumber *)dictionary[@"statuses_count"];
        
        //making sure the profile image is not blurry
        self.profilePicture = [self.profilePicture stringByReplacingOccurrencesOfString:@"_normal" withString:@""];
    }
    return self;
}

@end
