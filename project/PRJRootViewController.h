//
//  PRJRootViewController.h
//  project
//
//  Created by Thai Pham on 10/11/13.
//  Copyright (c) 2013 Thai Pham. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PRJPracticeViewController;
@class PRJQuizViewController;
@class LearnViewController;


@interface PRJRootViewController : UIViewController
@property (strong,nonatomic)PRJPracticeViewController *practiceController;
@property (strong,nonatomic)PRJQuizViewController *quizController;
@property (strong,nonatomic)LearnViewController *learningController;

@property(strong,nonatomic)NSString *viewTitle;
- (IBAction)learningViewButton:(UIBarButtonItem *)sender;
- (IBAction)practiceViewButton:(UIBarButtonItem *)sender;
- (IBAction)quizViewButton:(UIBarButtonItem *)sender;


@end
