//
//  UserProfileViewController.h
//  twitter
//
//  Created by Rigre Reinier Garciandia Larquin on 7/1/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserProfileViewController : UIViewController

@property (weak, nonatomic) User *user;

@end

NS_ASSUME_NONNULL_END
