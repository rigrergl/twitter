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
                 NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
            }
        }];
    }
}

- (IBAction)didTapRetweet:(UIButton *)sender {
    if(!self.retweeted) {
        //Update the local tweet model
        self.retweeted = YES;
        self.retweetCount += 1;
        //Update cell UI
        [self refreshData];
        
        //Send a POST request to the POST favorites/create endpoint
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
             }
         }];
    } else {
        //Update the local tweet model
        self.retweeted = NO;
        self.retweetCount -= 1;
        //Update cell UI
        [self refreshData];
        
        //Send a POST request to the POST favorites/destroy endpoint
        [[APIManager shared] unretweet:self.tweet completion: ^(Tweet *tweet, NSError *error){
            if(error){
                 NSLog(@"Error unretweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unretweeted the following Tweet: %@", tweet.text);
            }
        }];
    }
}


- (void)refreshData{
    self.favoritedLabel.text = [NSString stringWithFormat:@"%ld", self.favoritedCount];
    self.retweetCountLabel.text = [NSString stringWithFormat:@"%ld", self.retweetCount];
    [self.favoriteButton setSelected:self.favorited];
    [self.retweetButton setSelected:self.retweeted];
}

- (void)setTweet: (Tweet *) tweet {
    _tweet = tweet;
    self.name.text = tweet.user.name;

    //adding "@" to screenname
    NSString * leadingString  = @"@";
    self.screenName.text = [leadingString stringByAppendingString: tweet.user.screenName];

    self.date.text = self.tweet.createdAtString;
    self.text.text = self.tweet.text;
    self.favoritedLabel.text = [NSString stringWithFormat:@"%d", tweet.favoriteCount];
    self.retweetCountLabel.text = [NSString stringWithFormat:@"%d", tweet.retweetCount];
    self.favoritedCount = tweet.favoriteCount;
    self.retweetCount = tweet.retweetCount;
    self.favorited = tweet.favorited;
    self.retweeted = tweet.retweeted;

    //set cell buttons
    [self.favoriteButton setBackgroundImage:[UIImage imageNamed:@"favor-icon"] forState: UIControlStateNormal];
    [self.favoriteButton setBackgroundImage:[UIImage imageNamed:@"favor-icon-red"] forState: UIControlStateSelected];
    [self.favoriteButton setSelected:tweet.favorited];
    [self.retweetButton setBackgroundImage:[UIImage imageNamed:@"retweet-icon"] forState: UIControlStateNormal];
    [self.retweetButton setBackgroundImage:[UIImage imageNamed:@"retweet-icon-green"] forState: UIControlStateSelected];
    [self.retweetButton setSelected:tweet.retweeted];

    //setting the image
    NSString *URLString = tweet.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    self.profilePicture.image = [UIImage imageWithData:urlData];
}

@end
