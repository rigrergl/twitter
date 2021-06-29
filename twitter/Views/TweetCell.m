//
//  TweetCell.m
//  twitter
//
//  Created by Rigre Reinier Garciandia Larquin on 6/28/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "APIManager.h"

@implementation TweetCell

- (IBAction)didTapFavorite:(UIButton *)sender {
    if(!self.favorited) {
        //Update the local tweet model
        self.favorited = YES;
        self.favoritedCount += 1;
        //Update cell UI
        [self refreshData];
        
        //Send a POST request to the POST favorites/create endpoint
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
             }
         }];
    } else {
        //Update the local tweet model
        self.favorited = NO;
        self.favoritedCount -= 1;
        //Update cell UI
        [self refreshData];
        
        // TODO: Send a POST request to the POST favorites/destroy endpoint
        [[APIManager shared] unfavorite:self.tweet completion: ^(Tweet *tweet, NSError *error){
            if(error){
                 NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
            }
        }];
    }
}

- (void) refreshData{
    self.favoritedLabel.text = [NSString stringWithFormat:@"%ld", self.favoritedCount];
    self.retweetCountLabel.text = [NSString stringWithFormat:@"%ld", self.retweetCount];
    [self.favoriteButton setSelected:self.favorited];
}

@end
