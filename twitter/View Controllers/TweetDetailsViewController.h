//
//  TweetDetailsViewController.h
//  twitter
//
//  Created by Rigre Reinier Garciandia Larquin on 6/30/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@interface TweetDetailsViewController : UIViewController

//properties
@property (weak, nonatomic) Tweet *tweet;
@property (nonatomic) NSInteger retweetCount;
@property (nonatomic) NSInteger favoritedCount;
@property (nonatomic) BOOL favorited;
@property (nonatomic) BOOL retweeted;

//methods
- (void)setTweet: (Tweet *)tweet;

@end

NS_ASSUME_NONNULL_END
