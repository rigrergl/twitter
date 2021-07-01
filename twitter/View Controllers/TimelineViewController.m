//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "Tweet.h"
#import "TweetCell.h"
#import "ComposeViewController.h"
#import "TweetDetailsViewController.h"

@interface TimelineViewController () <ComposeViewControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *arrayOfTweets;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (assign, nonatomic) BOOL isMoreDataLoading;

@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchTimeline) forControlEvents:UIControlEventValueChanged];
    [self.collectionView insertSubview:self.refreshControl atIndex:0];
    [self fetchTimeline];
    
    
    UICollectionViewFlowLayout *layout = self.collectionView.collectionViewLayout;
    layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize;
    
    //disabling AutoLayout logs
    [[NSUserDefaults standardUserDefaults] setValue:@(NO) forKey:@"_UIConstraintBasedLayoutLogUnsatisfiable"];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [self.collectionView reloadData];
}

- (void)fetchTimeline {
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            self.arrayOfTweets = tweets;
            NSLog(@"😎😎😎 Successfully loaded home timeline");
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
        [self.collectionView reloadData];
        [self.refreshControl endRefreshing];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logoutButtonClicked:(UIBarButtonItem *)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    
    [[APIManager shared] logout];
}

- (void)didTweet:(nonnull Tweet *)tweet {
    NSLog(@"didTweet called: %@", tweet);
    [self.arrayOfTweets insertObject:tweet atIndex:0];
    [self.collectionView reloadData];
}

#pragma mark - Collection View Delegate Methods
- (nonnull UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TweetCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TweetCell" forIndexPath:indexPath];
    
    Tweet *tweet = self.arrayOfTweets[indexPath.item];
    [cell setTweet:tweet];
    
    //setting cell label width
    CGFloat safeAreaWidth = self.view.safeAreaLayoutGuide.layoutFrame.size.width;
    CGFloat minWidth = 150;
    if(safeAreaWidth > 400){
        cell.textWidthConstraint.constant = [@(MAX(safeAreaWidth/2 - 150, minWidth)) doubleValue]; //making sure it's the min size
    }
    else {
        cell.textWidthConstraint.constant = [@(MAX(safeAreaWidth - 150, minWidth)) doubleValue]; //making sure it's the min size
    }
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrayOfTweets.count;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(!self.isMoreDataLoading){
        // Calculate the position of one screen length before the bottom of the results
        int scrollViewContentHeight = self.collectionView.contentSize.height;
        int scrollOffsetThreshold = scrollViewContentHeight - self.collectionView.bounds.size.height;
        
        // When the user has scrolled past the threshold, start requesting
        if(scrollView.contentOffset.y > scrollOffsetThreshold && self.collectionView.isDragging) {
            self.isMoreDataLoading = true;
            [self loadMoreData];
        }
    }
}

- (void)loadMoreData{
    NSLog(@"LOG MORE DATA CALLED//////////////////////////////////////////////////");
    [[APIManager shared] getHomeTimelineWithCompletion: (self.arrayOfTweets.count + 20) completion: ^(NSArray *tweets, NSError *error) {
        if (tweets) {
            self.arrayOfTweets = tweets;
            NSLog(@"😎😎😎 Successfully loaded more tweets");
        } else {
            NSLog(@"😫😫😫 Error getting more tweets: %@", error.localizedDescription);
        }
        self.isMoreDataLoading = false;
        [self.collectionView reloadData];
        
    }];
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"homeToCompose"]) {
        UINavigationController *navigationController = [segue destinationViewController];
        ComposeViewController *composeController = (ComposeViewController *)navigationController.topViewController;
        composeController.delegate = self;
    }
    else if ([segue.identifier isEqualToString:@"homeToDetails"]) {
        // TODO: Prepare segue to details view
        TweetDetailsViewController *tweetDetailsViewController = [segue destinationViewController];
        
        //getting the tweet to display
        TweetCell *tappedCell = sender;
        Tweet *tweet = tappedCell.tweet;
        
        //initializing view controller
        tweetDetailsViewController.tweet = tweet;
        
    }
}



@end
