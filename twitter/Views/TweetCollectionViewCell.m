//
//  TweetCollectionViewCell.m
//  twitter
//
//  Created by Rigre Reinier Garciandia Larquin on 6/30/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "TweetCollectionViewCell.h"

@interface TweetCollectionViewCell ()

@property (strong, nonatomic) IBOutlet TweetCollectionViewCell *contentView;
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation TweetCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

///
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if(self) {
        [self customInit];
    }
    
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self customInit];
    }
    
    return self;
}

- (void)customInit {
//    [[NSBundle mainBundle] loadNibNamed:@"TweetCollectionViewCell" owner:self options:nil];
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
}
///

@end
