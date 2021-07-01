//
//  UserProfileViewController.m
//  twitter
//
//  Created by Rigre Reinier Garciandia Larquin on 7/1/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "UserProfileViewController.h"

@interface UserProfileViewController ()

@end

@implementation UserProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameLabel.text = self.user.name;
    self.screenNameLabel.text = self.user.screenName;
    self.descriptionLabel.text = self.user.userDescription;
    self.locationLabel.text = self.user.location;
    self.followingCountLabel.text = [NSNumberFormatter localizedStringFromNumber: self.user.followingCount numberStyle:nil];
    self.followersCountLabel.text = [NSNumberFormatter localizedStringFromNumber: self.user.followersCount numberStyle:nil];
    self.tweetsCountLabel.text = [NSNumberFormatter localizedStringFromNumber: self.user.tweetsCount numberStyle:nil];
    
    //setting profile image
    NSString *URLString = self.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    self.profileImage.image = [UIImage imageWithData:urlData];
    
    //setting banner image
    URLString = self.user.bannerPicture;
    url = [NSURL URLWithString:URLString];
    urlData = [NSData dataWithContentsOfURL:url];
    self.bannerImage.image = [UIImage imageWithData:urlData];
    
    //adding vefified logo if applicable
    self.verifiedImage.hidden = !self.user.verified;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
