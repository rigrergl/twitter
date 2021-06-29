//
//  TweetCell.m
//  twitter
//
//  Created by Rigre Reinier Garciandia Larquin on 6/28/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"

@implementation TweetCell

- (IBAction)didTapFavorite:(UIButton *)sender {
    if(!self.favorited) {
        //Update the local tweet model
        self.favorited = YES;
        self.favoritedCount += 1;
        //Update cell UI
        [self refreshData];
        // TODO: Send a POST request to the POST favorites/create endpoint
    } else {
        //Update the local tweet model
        self.favorited = NO;
        self.favoritedCount -= 1;
        //Update cell UI
        [self refreshData];
        // TODO: Send a POST request to the POST favorites/create endpoint
    }
}

- (void) refreshData{
    self.favoritedLabel.text = [NSString stringWithFormat:@"%ld", self.favoritedCount];
    self.retweetCountLabel.text = [NSString stringWithFormat:@"%ld", self.retweetCount];
    [self.favoriteButton setSelected:self.favorited];
}

@end
