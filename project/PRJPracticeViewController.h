//
//  PRJPracticeViewController.h
//  project
//
//  Created by Thai Pham on 10/24/13.
//  Copyright (c) 2013 Thai Pham. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PracticeViewController;

@interface PRJPracticeViewController : UIViewController
@property   (strong,nonatomic) PracticeViewController *practiceController;
@property (strong, nonatomic) IBOutlet UILabel *answer;
@property (strong, nonatomic) IBOutlet UILabel *answerBox;
@property (strong, nonatomic) IBOutlet UIButton *goButton;
@property (strong, nonatomic) IBOutlet UIImageView *imgTouch;
@property (strong, nonatomic) IBOutlet UIImageView *imgArrow;
@property (strong, nonatomic) IBOutlet UILabel *guide;
@property (strong, nonatomic) IBOutlet UINavigationBar *navTitle;
- (IBAction)goButton:(UIButton *)sender;

@end
