//
//  QuizViewController.h
//  project
//
//  Created by Thai Pham on 10/18/13.
//  Copyright (c) 2013 Thai Pham. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Question;
@class UserAnswer;

@interface QuizViewController : UIViewController<UIActionSheetDelegate>
@property (strong, nonatomic) IBOutlet UITextView *questionTextView;
@property (strong, nonatomic) IBOutlet UITextView *resultTextView;
@property (strong, nonatomic) IBOutlet UIButton *answerLable1;
@property (strong, nonatomic) IBOutlet UIButton *answerLable2;
@property (strong, nonatomic) IBOutlet UIButton *answerLable3;
@property (strong, nonatomic) IBOutlet UIButton *answerLable4;
@property NSInteger buttonPressStatus;
@property NSInteger buttonPressBack;

@property NSString *answer;
//Create an array of question
@property NSMutableArray *myArray;
//Create an array of user's answers
@property NSMutableArray *userAnswerArray;
//Hold size of array of questions
@property NSInteger arraySize;
//current position of question showing
@property NSInteger index;
@property NSString *buttonBackOrNext;
@property NSInteger numOfQuestion4Quiz;

-(void)getQuestion:(NSInteger)i;
//count emlements in the array of question
-(NSInteger)getArraySize;


- (IBAction)answerButton1:(UIButton *)sender;
- (IBAction)answerButton2:(UIButton *)sender;
- (IBAction)answerButton3:(UIButton *)sender;
- (IBAction)answerButton4:(UIButton *)sender;
- (IBAction)nextButton:(UIButton *)sender;
- (IBAction)backButton:(UIButton *)sender;


@end
