//
//  ProfileViewController.m
//  twitter
//
//  Created by Rigre Reinier Garciandia Larquin on 6/28/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "ProfileViewController.h"
#import "APIManager.h"
#import "ProfileTweetCell.h"
#import "Tweet.h"

@interface ProfileViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray * arrayOfTweets;
@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // Get timeline
    [[APIManager shared] getUserTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            self.arrayOfTweets = tweets;
            NSLog(@"😎😎😎 Successfully loaded home timeline");
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
        [self.tableView reloadData];
    }];
    
    [[APIManager shared] getUserProfileData:^(NSDictionary *user, NSError *error) {
        self.profileNameLabel.text = user[@"screen_name"];
        self.memoLabel.text = user[@"description"];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ProfileTweetCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"ProfileTweetCell"];
    
    Tweet *tweet = self.arrayOfTweets[indexPath.row];
    
    cell.tableBodyLabel.text = tweet.text;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayOfTweets.count;
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
