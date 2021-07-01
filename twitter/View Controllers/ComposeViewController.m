//
//  ComposeViewController.m
//  twitter
//
//  Created by Rigre Reinier Garciandia Larquin on 6/28/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"

@interface ComposeViewController ()

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.textView becomeFirstResponder];
    self.textView.delegate = self;
}

- (IBAction)closeButtonClicked:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)tweetButtonClicked:(UIBarButtonItem *)sender {
    [[APIManager shared] postStatusWithText: self.textView.text completion:^(Tweet *tweet, NSError *error) {
        if (!error) {
            [self.delegate didTweet:tweet];
            NSLog(@"😎😎😎 Successfully uploaded Tweet");
        } else {
            NSLog(@"😫😫😫 Error uploading tweet: %@", error.localizedDescription);
        }
        [self dismissViewControllerAnimated:true completion:nil];
    }];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
   // Set the max character limit
    int characterLimit = 140;

    // Construct what the new text would be if we allowed the user's latest edit
    NSString *newText = [self.textView.text stringByReplacingCharactersInRange:range withString:text];
    
    // TODO: Update character count label

    // Should the new text should be allowed? True/False
    return newText.length < characterLimit;
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
