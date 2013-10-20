//
//  QuizViewController.m
//  project
//
//  Created by Thai Pham on 10/18/13.
//  Copyright (c) 2013 Thai Pham. All rights reserved.
//

#import "QuizViewController.h"
#import "Question.h"
#import "UserAnswer.h"
#import "ArrayOfQuestion.h"

@interface QuizViewController ()

@end

@implementation QuizViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _resultTextView.hidden = TRUE;
    //Button answer is not pressed yet
    _buttonPressStatus = 0;
    _buttonPressBack = 0;
    //Number of question used for the Quiz
    _numOfQuestion4Quiz = 15;
    //Initialize a new Array of Question
    ArrayOfQuestion *myArrayOfQuestion = [[ArrayOfQuestion alloc] init];
    //assign the array of question after initialized into myArray which acctually contain questions
    //_myArray = [myArrayOfQuestion initArrayOfQuestion];
    _myArray = [myArrayOfQuestion arrayOfQuestionForQuiz:_numOfQuestion4Quiz];
    //Create array to hole user answers
    _userAnswerArray = [[NSMutableArray alloc] init];
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
    [_answerLable1 setTitle:[NSString stringWithFormat:@"%@", myQuestion.answer1] forState:UIControlStateNormal];
    [_answerLable2 setTitle:[NSString stringWithFormat:@"%@", myQuestion.answer2] forState:UIControlStateNormal];
    [_answerLable3 setTitle:[NSString stringWithFormat:@"%@", myQuestion.answer3] forState:UIControlStateNormal];
    [_answerLable4 setTitle:[NSString stringWithFormat:@"%@", myQuestion.answer4] forState:UIControlStateNormal];
    _answer = myQuestion.correctAnswer;
}

//count emlements in the array of question
-(NSInteger)getArraySize{
    NSInteger size = 0;
    for(id obj in _myArray){
        size++;
    }
    return size;
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if([_buttonBackOrNext isEqualToString:@"next"]){
        if(buttonIndex == [actionSheet destructiveButtonIndex]){

            //Coding to show result here
            NSString *msg = [NSString stringWithFormat:@"Here is your result \n"];
            NSInteger score = 0;
            NSInteger total = 0;
            _resultTextView.text = [_resultTextView.text stringByAppendingString:msg];
            for (UserAnswer *r in _userAnswerArray) {
                msg = [NSString stringWithFormat:@"Question: %@ \n Your response: %@ \n Correct answer: %@ \n Point: %d \n\n",r.question, r.userAnswer, r.correctAnswer, r.point];
                _resultTextView.text = [_resultTextView.text stringByAppendingString:msg];
                score = score + r.point;
                total++;
            }
            msg = [NSString stringWithFormat:@"Your score: %d/%d", score,total];
            _resultTextView.text = [_resultTextView.text stringByAppendingFormat:msg];
            _resultTextView.hidden = FALSE;
            if(score*1.0/total >= 0.7){
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"You do a nice job" delegate:nil cancelButtonTitle:@"Ok, thanks" otherButtonTitles:nil];
                [alert show];
            }else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Well, just practice more" delegate:nil cancelButtonTitle:@"Yes, I will" otherButtonTitles:nil];
                [alert show];
            }
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Your action was cancelled" delegate:nil cancelButtonTitle:@"That's right" otherButtonTitles:nil];
            [alert show];
        }
    }
}

- (IBAction)answerButton1:(UIButton *)sender {
    UserAnswer *answer = [[UserAnswer alloc]init];
    Question *currentQuestion = [_myArray objectAtIndex:_index];
    answer.question = currentQuestion.question;
    answer.userAnswer = currentQuestion.answer1;
    answer.correctAnswer = currentQuestion.correctAnswer;
    //check if user anser correct
    if([currentQuestion.answer1 isEqualToString:currentQuestion.correctAnswer]){
        answer.point = 1;
    }else{
        answer.point = 0;
    }
    //add user's answer into userAnswerArray
    _userAnswerArray[_index] = answer;
    _buttonPressStatus = 1;
}

- (IBAction)answerButton2:(UIButton *)sender {
    UserAnswer *answer = [[UserAnswer alloc]init];
    Question *currentQuestion = [_myArray objectAtIndex:_index];
    answer.question = currentQuestion.question;
    answer.userAnswer = currentQuestion.answer2;
    answer.correctAnswer = currentQuestion.correctAnswer;
    //check if user anser correct
    if([currentQuestion.answer2 isEqualToString:currentQuestion.correctAnswer]){
        answer.point = 1;
    }else{
        answer.point = 0;
    }
    //add user's answer into userAnswerArray
    _userAnswerArray[_index] = answer;
    _buttonPressStatus = 2;
}

- (IBAction)answerButton3:(UIButton *)sender {
    UserAnswer *answer = [[UserAnswer alloc]init];
    Question *currentQuestion = [_myArray objectAtIndex:_index];
    answer.question = currentQuestion.question;
    answer.userAnswer = currentQuestion.answer3;
    answer.correctAnswer = currentQuestion.correctAnswer;
    //check if user anser correct
    if([currentQuestion.answer3 isEqualToString:currentQuestion.correctAnswer]){
        answer.point = 1;
    }else{
        answer.point = 0;
    }
    //add user's answer into userAnswerArray
    _userAnswerArray[_index] = answer;
    _buttonPressStatus = 3;
}

- (IBAction)answerButton4:(UIButton *)sender {
    UserAnswer *answer = [[UserAnswer alloc]init];
    Question *currentQuestion = [_myArray objectAtIndex:_index];
    answer.question = currentQuestion.question;
    answer.userAnswer = currentQuestion.answer4;
    answer.correctAnswer = currentQuestion.correctAnswer;
    //check if user anser correct
    if([currentQuestion.answer4 isEqualToString:currentQuestion.correctAnswer]){
        answer.point = 1;
    }else{
        answer.point = 0;
    }
    //add user's answer into userAnswerArray
    _userAnswerArray[_index] = answer;
    _buttonPressStatus = 4;
}

- (IBAction)nextButton:(UIButton *)sender {
    //_index = arc4random_uniform(_arraySize);//get random question
    _buttonBackOrNext = @"next";
    if(_index == _numOfQuestion4Quiz-1){
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"You reach the end of the quiz, click OK to see result, or Cancel to revise your answers!" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"OK, see my result" otherButtonTitles:@"Cancel, let me revise", nil];
        [actionSheet showInView:self.view];
    }else{
        //if user does not press answer and this is not revised question
        if((_buttonPressStatus == 0)&&(_buttonPressBack<=0)){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Please choose an answer before moving to next question" delegate:nil cancelButtonTitle:@"Ok, let me choose" otherButtonTitles:nil];
            [alert show];
        }else{
            if(_buttonPressStatus==0){//no answer is pressed, but this is revised question
                _buttonPressBack--;
            }
            //After save current answer question, set status of button press to 0 as not pressed for new question
            _buttonPressStatus = 0;
            _index++;
            [self getQuestion:_index];
        }
    }
}

- (IBAction)backButton:(UIButton *)sender {
    //_index = arc4random_uniform(_arraySize);//get random question
    _buttonBackOrNext = @"back";
    
    if(_index == 0){
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"You are at the first question, just click NEXT button to continue!" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [actionSheet showInView:self.view];
    }else{
        _index--;
        [self getQuestion:_index];
        //User click back button to revise
        _buttonPressBack++;
    }
}
@end
