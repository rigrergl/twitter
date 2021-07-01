//
//  TweetCell.h
//  twitter
//
//  Created by Rigre Reinier Garciandia Larquin on 6/28/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

//properties
@interface TweetCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *screenName;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *favoritedLabel;
@property (weak, nonatomic) IBOutlet UILabel *retweetCountLabel;
@property (nonatomic) NSInteger retweetCount;
@property (nonatomic) NSInteger favoritedCount;
@property (nonatomic) BOOL favorited;
@property (nonatomic) BOOL retweeted;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;
@property (weak, nonatomic) Tweet *tweet;
@property (nonatomic) CGRect safeAreaLayoutFrame;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textWidthConstraint;

//methods
- (void)setTweet: (Tweet *)tweet;

@end

NS_ASSUME_NONNULL_END
