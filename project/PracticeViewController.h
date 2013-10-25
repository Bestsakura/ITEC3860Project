//
//  PracticeViewController.h
//  project
//
//  Created by Thai Pham on 10/23/13.
//  Copyright (c) 2013 Thai Pham. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Question;

@interface PracticeViewController : UIViewController
//Set up Interface Lables
- (IBAction)hintButton:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UITextView *questionTextView;
@property (strong, nonatomic) IBOutlet UILabel *answerBoxLable;
@property (strong, nonatomic) IBOutlet UILabel *answerLable1;
@property (strong, nonatomic) IBOutlet UILabel *answerLable2;
@property (strong, nonatomic) IBOutlet UILabel *answerLable3;
@property (strong, nonatomic) IBOutlet UILabel *answerLable4;
@property (strong, nonatomic) IBOutlet UILabel *correctLable;
@property (strong, nonatomic) IBOutlet UILabel *incorrectLable;
@property (strong, nonatomic) IBOutlet UILabel *resultLable;
@property CGPoint answer1Location;
@property CGPoint answer2Location;
@property CGPoint answer3Location;
@property CGPoint answer4Location;
@property NSInteger answerLableNum;
//End of UI
@property NSString *answer;
@property NSString *hint;
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


//-(NSString *)checkAnswer:(NSString *)answer;
-(BOOL)checkAnswer:(NSString *)answer;


@end
