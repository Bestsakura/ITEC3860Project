//
//  PracticeViewController.m
//  project
//
//  Created by Thai Pham on 10/23/13.
//  Copyright (c) 2013 Thai Pham. All rights reserved.
//

#import "PracticeViewController.h"
#import "Question.h"
#import "ArrayOfQuestion.h"
#import <QuartzCore/QuartzCore.h>

@interface PracticeViewController ()

@end

@implementation PracticeViewController

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
    _correctCount = 0;
    _tryCount = 0;
    _questionTextView.layer.cornerRadius = 10;
    _answerBoxLable.layer.cornerRadius = 6;
    _answerBoxLable.layer.borderWidth = 2;
    _answerBoxLable.layer.borderColor=[UIColor orangeColor].CGColor;

    _answerLable1.layer.cornerRadius = 6;
    _answerLable1.layer.borderWidth = 2;
    _answerLable1.layer.borderColor = [UIColor whiteColor].CGColor;
    _answerLable2.layer.cornerRadius = 6;
    _answerLable2.layer.borderWidth = 2;
    _answerLable2.layer.borderColor = [UIColor whiteColor].CGColor;
    _answerLable3.layer.cornerRadius = 6;
    _answerLable3.layer.borderWidth = 2;
    _answerLable3.layer.borderColor = [UIColor whiteColor].CGColor;
    _answerLable4.layer.cornerRadius = 6;
    _answerLable4.layer.borderWidth = 2;
    _answerLable4.layer.borderColor = [UIColor whiteColor].CGColor;
    
    _answer1Location = _answerLable1.center;
    _answer2Location = _answerLable2.center;
    _answer3Location = _answerLable3.center;
    _answer4Location = _answerLable4.center;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panDetected:)];
    [self.view addGestureRecognizer:pan];
    
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
    //Add sound effect to session
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *rightSound = [mainBundle pathForResource:@"right" ofType:@"wav"];
    NSString *wrongSound = [mainBundle pathForResource:@"wrong" ofType:@"wav"];
    NSError *error;
    NSURL *url1 = [NSURL fileURLWithPath:rightSound];
    NSURL *url2 = [NSURL fileURLWithPath:wrongSound];
    _audioPlayer1 = [[AVAudioPlayer alloc]initWithContentsOfURL:url1 error:&error];
    _audioPlayer2 = [[AVAudioPlayer alloc]initWithContentsOfURL:url2 error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]); //returns a string description of the error
    } else {
        //prepare the audio player, acquire the hardware
        [_audioPlayer1 prepareToPlay];
        [_audioPlayer2 prepareToPlay];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint point= [touch locationInView:touch.view];
    if(CGRectContainsPoint(_answerLable1.frame, point)){
        _answerLableNum = 1;
    }else if (CGRectContainsPoint(_answerLable2.frame, point)){
        _answerLableNum = 2;
    }else if (CGRectContainsPoint(_answerLable3.frame, point)){
        _answerLableNum = 3;
    }else if (CGRectContainsPoint(_answerLable4.frame, point)){
        _answerLableNum = 4;
    }
}
-(void)panDetected:(UIPanGestureRecognizer *)sender
{
    if(_answerLableNum == 1){
        CGPoint amtOfTranslation = [sender translationInView:self.view];
        CGPoint imageViewPosition = self.answerLable1.center;
        imageViewPosition.x = imageViewPosition.x + amtOfTranslation.x;
        imageViewPosition.y = imageViewPosition.y + amtOfTranslation.y;
        self.answerLable1.center = imageViewPosition;
        [sender setTranslation:CGPointZero inView:self.view];
        
        if(sender.state == UIGestureRecognizerStateEnded){
            if(CGRectContainsPoint(_answerBoxLable.frame,_answerLable1.center)){
                _answerLable1.center = _answerBoxLable.center;
                _answerLable2.center = _answer2Location;
                _answerLable3.center = _answer3Location;
                _answerLable4.center = _answer4Location;
                //Check the answer
                if([self checkAnswer:_answerLable1.text]==YES){
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulation!" message:@"You got it..." delegate:nil cancelButtonTitle:@"Next Question" otherButtonTitles:nil];
                    [alert show];
                    _index = arc4random_uniform(_arraySize);//get random question
                    //NSLog(@"%d",_index);
                    [self getQuestion:_index];
                    _answerLable1.center = _answer1Location;
                }else{
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry..." message:@"It's a wrong answer." delegate:nil cancelButtonTitle:@"Try again!" otherButtonTitles:nil];
                    [alert show];
                }
            }else{
                _answerLable1.center = _answer1Location;
            }
        }
    }else if (_answerLableNum == 2){
        CGPoint amtOfTranslation = [sender translationInView:self.view];
        CGPoint imageViewPosition = self.answerLable2.center;
        imageViewPosition.x = imageViewPosition.x + amtOfTranslation.x;
        imageViewPosition.y = imageViewPosition.y + amtOfTranslation.y;
        self.answerLable2.center = imageViewPosition;
        [sender setTranslation:CGPointZero inView:self.view];
        
        if(sender.state == UIGestureRecognizerStateEnded){
            if(CGRectContainsPoint(_answerBoxLable.frame,_answerLable2.center)){
                _answerLable2.center = _answerBoxLable.center;
                _answerLable1.center = _answer1Location;
                _answerLable3.center = _answer3Location;
                _answerLable4.center = _answer4Location;
                //Check the answer
                if([self checkAnswer:_answerLable2.text]==YES){
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulation!" message:@"You got it..." delegate:nil cancelButtonTitle:@"Next Question" otherButtonTitles:nil];
                    [alert show];
                    _index = arc4random_uniform(_arraySize);//get random question
                    //NSLog(@"%d",_index);
                    [self getQuestion:_index];
                    _answerLable2.center = _answer2Location;
                }else{
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry..." message:@"It's a wrong answer." delegate:nil cancelButtonTitle:@"Try again!" otherButtonTitles:nil];
                    [alert show];
                }
            }else{
                _answerLable2.center = _answer2Location;
            }
        }
    }else if (_answerLableNum == 3){
        CGPoint amtOfTranslation = [sender translationInView:self.view];
        CGPoint imageViewPosition = self.answerLable3.center;
        imageViewPosition.x = imageViewPosition.x + amtOfTranslation.x;
        imageViewPosition.y = imageViewPosition.y + amtOfTranslation.y;
        self.answerLable3.center = imageViewPosition;
        [sender setTranslation:CGPointZero inView:self.view];
        
        if(sender.state == UIGestureRecognizerStateEnded){
            if(CGRectContainsPoint(_answerBoxLable.frame,_answerLable3.center)){
                _answerLable3.center = _answerBoxLable.center;
                _answerLable2.center = _answer2Location;
                _answerLable1.center = _answer1Location;
                _answerLable4.center = _answer4Location;
                //Check the answer
                if([self checkAnswer:_answerLable3.text]==YES){
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulation!" message:@"You got it..." delegate:nil cancelButtonTitle:@"Next Question" otherButtonTitles:nil];
                    [alert show];
                    _index = arc4random_uniform(_arraySize);//get random question
                    //NSLog(@"%d",_index);
                    [self getQuestion:_index];
                    _answerLable3.center = _answer3Location;
                }else{
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry..." message:@"It's a wrong answer." delegate:nil cancelButtonTitle:@"Try again!" otherButtonTitles:nil];
                    [alert show];
                }
            }else{
                _answerLable3.center = _answer3Location;
            }
        }
    }else if (_answerLableNum == 4){
        CGPoint amtOfTranslation = [sender translationInView:self.view];
        CGPoint imageViewPosition = self.answerLable4.center;
        imageViewPosition.x = imageViewPosition.x + amtOfTranslation.x;
        imageViewPosition.y = imageViewPosition.y + amtOfTranslation.y;
        self.answerLable4.center = imageViewPosition;
        [sender setTranslation:CGPointZero inView:self.view];
        
        if(sender.state == UIGestureRecognizerStateEnded){
            if(CGRectContainsPoint(_answerBoxLable.frame,_answerLable4.center)){
                _answerLable4.center = _answerBoxLable.center;
                _answerLable2.center = _answer2Location;
                _answerLable3.center = _answer3Location;
                _answerLable1.center = _answer1Location;
                //Check the answer
                if([self checkAnswer:_answerLable4.text]==YES){
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulation!" message:@"You got it..." delegate:nil cancelButtonTitle:@"Next Question" otherButtonTitles:nil];
                    [alert show];
                    _index = arc4random_uniform(_arraySize);//get random question
                    //NSLog(@"%d",_index);
                    [self getQuestion:_index];
                    _answerLable4.center = _answer4Location;
                }else{
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry..." message:@"It's a wrong answer." delegate:nil cancelButtonTitle:@"Try again!" otherButtonTitles:nil];
                    [alert show];
                }
            }else{
                _answerLable4.center = _answer4Location;
            }
        }
    }
}

//display infomation of question at index to screen
-(void)getQuestion:(NSInteger)index
{
    Question *myQuestion = [_myArray objectAtIndex:index];
    _questionTextView.text = myQuestion.question;
    _answerLable1.text = myQuestion.answer1;
    _answerLable2.text = myQuestion.answer2;
    _answerLable3.text = myQuestion.answer3;
    _answerLable4.text = myQuestion.answer4;
    _answer = myQuestion.correctAnswer;
    _hint = myQuestion.hint;
}

//count emlements in the array of question
-(NSInteger)getArraySize{
    NSInteger size = 0;
    for(id obj in _myArray){
        size++;
    }
    return size;
}
-(BOOL)checkAnswer:(NSString *)userAnswer{

    _tryCount++;
    if([_answer isEqualToString:userAnswer]){
        _correctCount++;
        _correctLable.text = [NSString stringWithFormat:@"%d",_correctCount];
        _resultLable.text = [NSString stringWithFormat:@"%d%%",_correctCount*100/_tryCount];
        [_audioPlayer1 play];
        return YES;
    }else{
        _incorrectLable.text = [NSString stringWithFormat:@"%d",_tryCount-_correctCount];
        _resultLable.text = [NSString stringWithFormat:@"%d%%",_correctCount*100/_tryCount];
        [_audioPlayer2 play];
        return NO;
    }
}
- (IBAction)hintButton:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Help" message:_hint delegate:nil cancelButtonTitle:@"Ok, I got it." otherButtonTitles:nil];
    [alert show];
}
@end
