//
//  ProfileTweetCell.h
//  twitter
//
//  Created by Rigre Reinier Garciandia Larquin on 6/28/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProfileTweetCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *tweetAuthorLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tableBodyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;



@end

NS_ASSUME_NONNULL_END
