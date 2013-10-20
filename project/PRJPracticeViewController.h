//
//  PRJPracticeViewController.h
//  project
//
//  Created by Thai Pham on 10/4/13.
//  Copyright (c) 2013 Thai Pham. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Question;

@interface PRJPracticeViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *questionTextView;
//@property (strong, nonatomic) IBOutlet UILabel *questionLable;
@property (strong, nonatomic) IBOutlet UIButton *answerButton1;
@property (strong, nonatomic) IBOutlet UIButton *answerButton2;
@property (strong, nonatomic) IBOutlet UIButton *answerButton3;
@property (strong, nonatomic) IBOutlet UIButton *answerButton4;
- (IBAction)answerButton1:(UIButton *)sender;
- (IBAction)answerButton2:(UIButton *)sender;
- (IBAction)answerButton3:(UIButton *)sender;
- (IBAction)answerButton4:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UILabel *testLable;
@property (strong, nonatomic) IBOutlet UILabel *resultLable;

@property NSString *answer;
//Array of questions
@property NSMutableArray *myArray;
//Hold size of array of questions
@property NSInteger arraySize;
//current position of question showing
@property NSInteger index;
//store number of try
@property NSInteger tryCount;
//store number of correct answer
@property NSInteger correctCount;

-(void)getQuestion:(NSInteger)i;
//count emlements in the array of question
-(NSInteger)getArraySize;
//go to previous question when user clicks BACK button
- (IBAction)backButton:(UIButton *)sender;
//go to next question when user clicks NEXT button
- (IBAction)nextButton:(UIButton *)sender;

-(NSString *)checkAnswer:(NSString *)answer;

@end
