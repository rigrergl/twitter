//
//  TweetCell.h
//  twitter
//
//  Created by Rigre Reinier Garciandia Larquin on 6/28/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TweetCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *screenName;

@end

NS_ASSUME_NONNULL_END
