//
//  PRJQuizViewController.h
//  project
//
//  Created by Thai Pham on 10/14/13.
//  Copyright (c) 2013 Thai Pham. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QuizViewController;

@interface PRJQuizViewController : UIViewController
@property (strong, nonatomic) IBOutlet UINavigationBar *navigationBarTitle;
@property QuizViewController *quizController;
- (IBAction)startQuizButton:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *startQuizButton;
@property (strong, nonatomic) IBOutlet UIImageView *imageQuizView;

@end
