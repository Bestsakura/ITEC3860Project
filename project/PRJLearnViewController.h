//
//  PRJLearnViewController.h
//  project
//
//  Created by Thai Pham on 10/24/13.
//  Copyright (c) 2013 Thai Pham. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LearnViewController;

@interface PRJLearnViewController : UIViewController
@property   (strong,nonatomic) LearnViewController *learnController;
@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) IBOutlet UIImageView *imgView;
- (IBAction)startButton:(UIButton *)sender;


@end
