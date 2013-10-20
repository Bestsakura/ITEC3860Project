//
//  LearnViewController.h
//  project
//
//  Created by Jared Marquez on 10/14/13.
//  Copyright (c) 2013 Thai Pham. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Question;
@interface LearnViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *LearnViewController;
@property (strong, nonatomic) IBOutlet UIWebView *videoView;
@property (strong, nonatomic) IBOutlet UITextView *questionView;
@property (strong, nonatomic) IBOutlet UIButton *videoCardButton;
@property (strong, nonatomic) IBOutlet UIButton *helpButton;
@property (strong, nonatomic) IBOutlet UILabel *helpView;
@property (strong, nonatomic) IBOutlet UITextView *answerView;
//Array of questions
@property NSMutableArray *myArray;
//Hold size of array of questions
@property NSInteger arraySize;
//current position of question showing
@property NSInteger index;
@property Question *myQuestion;
- (IBAction)videoSwitch:(id)sender;
- (IBAction)helpSwitch:(id)sender;



@end
