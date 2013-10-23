//
//  PRJPracticeViewController.m
//  project
//
//  Created by Thai Pham on 10/4/13.
//  Copyright (c) 2013 Thai Pham. All rights reserved.
//

#import "PRJPracticeViewController.h"
#import "Question.h"
#import "ArrayOfQuestion.h"

@interface PRJPracticeViewController ()

@end

@implementation PRJPracticeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _correctCount = 0;
    _tryCount = 0;
    //Initialize a new Array of Question
    ArrayOfQuestion *myArrayOfQuestion = [[ArrayOfQuestion alloc] init];
    //assign the array of question after initialized into myArray
    _myArray = [myArrayOfQuestion initArrayOfQuestion];
    //get the size of array
    _arraySize = [self getArraySize];
    //Load the first question to display at the starting screen
    _index = 0;
    //display question information of the first question
    
    [self getQuestion:_index];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//display infomation of question at index to screen
-(void)getQuestion:(NSInteger)index
{
    Question *myQuestion = [_myArray objectAtIndex:index];
    _questionTextView.text = myQuestion.question;
    [_answerButton1 setTitle:[NSString stringWithFormat:@"%@", myQuestion.answer1] forState:UIControlStateNormal];
    [_answerButton2 setTitle:[NSString stringWithFormat:@"%@", myQuestion.answer2] forState:UIControlStateNormal];
    [_answerButton3 setTitle:[NSString stringWithFormat:@"%@", myQuestion.answer3] forState:UIControlStateNormal];
    [_answerButton4 setTitle:[NSString stringWithFormat:@"%@", myQuestion.answer4] forState:UIControlStateNormal];
    _answer = myQuestion.correctAnswer;
    //_answer4Lable.text = myQuestion.answer4;
}

//count emlements in the array of question
-(NSInteger)getArraySize{
    NSInteger size = 0;
    for(id obj in _myArray){
        size++;
    }
    return size;
}

//go to previous question when user clicks BACK button
- (IBAction)backButton:(UIButton *)sender {
    _index = arc4random_uniform(_arraySize);//get random question
    //NSLog(@"%d",_index);
    [self getQuestion:_index];
    //set test lable to blank
    _testLable.text = @"";
}

//go to next question when user clicks NEXT button
- (IBAction)nextButton:(UIButton *)sender {
    _index = arc4random_uniform(_arraySize);//get random question
    //NSLog(@"%d",_index);
    [self getQuestion:_index];
    //set test lable to blank
    _testLable.text = @"";

}
- (IBAction)answerButton1:(UIButton *)sender {
    _testLable.text = [self checkAnswer:[[sender titleLabel] text]];
    
}

- (IBAction)answerButton2:(UIButton *)sender {
    _testLable.text = [self checkAnswer:[[sender titleLabel] text]];
}

- (IBAction)answerButton3:(UIButton *)sender {
    _testLable.text = [self checkAnswer:[[sender titleLabel] text]];
}

- (IBAction)answerButton4:(UIButton *)sender {
    _testLable.text = [self checkAnswer:[[sender titleLabel] text]];
}

-(NSString *)checkAnswer:(NSString *)userAnswer{
    if([_answer isEqualToString:userAnswer]){
        _correctCount++;
        _tryCount++;
        _resultLable.text = [NSString stringWithFormat:@"You tried: %d   Corrected: %d Your score: %d",_tryCount,_correctCount,_correctCount*100/_tryCount];
        return @"Yes, you got it!";
    }else{
        _tryCount++;
        _resultLable.text = [NSString stringWithFormat:@"You tried: %d   Corrected: %d Your score: %d",_tryCount,_correctCount,_correctCount*100/_tryCount];
        return @"Incorrect answer";
    }
}
@end
