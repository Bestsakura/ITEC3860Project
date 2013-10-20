//
//  LearnViewController.m
//  project
//
//  Created by Jared Marquez on 10/14/13.
//  Copyright (c) 2013 Thai Pham. All rights reserved.
//

#import "LearnViewController.h"
#import "Question.h"
#import "ArrayOfQuestion.h"

@interface LearnViewController ()

@end

@implementation LearnViewController

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
    //Initialize a new Array of Question
    ArrayOfQuestion *myArrayOfQuestion = [[ArrayOfQuestion alloc] init];
    //assign the array of question after initialized into myArray
    _myArray = [myArrayOfQuestion initArrayOfQuestion];
    //get the size of array
    _arraySize = [self getArraySize];
    //Load the first question to display at the starting screen
    _index = 0;
    _myQuestion = [_myArray objectAtIndex:_index];
    _questionView.text = _myQuestion.question;
    _answerView.text = _myQuestion.correctAnswer;
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
    tapGes.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer: tapGes];
    
    UISwipeGestureRecognizer *swipeLeftGes = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftDetected:)];
    [swipeLeftGes setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self.view addGestureRecognizer: swipeLeftGes];
    
    UISwipeGestureRecognizer *swipeRightGes = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRightDetected:)];
    [swipeRightGes setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.view addGestureRecognizer: swipeRightGes];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//count emlements in the array of question
-(NSInteger)getArraySize{
    NSInteger size = 0;
    for(id obj in _myArray){
        size++;
    }
    return size;
}

- (IBAction)videoSwitch:(id)sender {
    
    
    if (_videoView.isHidden == TRUE)
    {
        _videoView.hidden = FALSE;
        _answerView.hidden =TRUE;
        _questionView.hidden = TRUE;
        [_videoCardButton setTitle:@"Flash Card" forState:UIControlStateNormal];
        
        [self embedYouTube:@"http://www.youtube.com/embed/gtQJXzi3Yns" frame:(CGRectMake(20,20,250,250))];
        
    }
    else if (_videoView.isHidden == FALSE)
    {
        _videoView.hidden = TRUE;
        _questionView.hidden = FALSE;
        _answerView.hidden = TRUE;
        [_videoCardButton setTitle:@"Video" forState:UIControlStateNormal];
    }

}

- (IBAction)helpSwitch:(id)sender {
    if (_helpView.hidden == TRUE)
    {
        _helpView.hidden = FALSE;
        [_helpButton setTitle:@"Hide Help" forState: UIControlStateNormal];
    }
    else if (_helpView.hidden == FALSE)
    {
        _helpView.hidden = TRUE;
        [_helpButton setTitle:@"Show Help" forState: UIControlStateNormal];
    }
    
}


-(void) tapDetected:(UITapGestureRecognizer *)sender
{
    if (_questionView.hidden == FALSE && _videoView.hidden == TRUE)
    {
        _questionView.hidden = TRUE;
        _answerView.hidden = FALSE;
        _answerView.text = _myQuestion.correctAnswer;
    }
    else if  (_answerView.hidden == FALSE && _videoView.hidden == TRUE)
    {
        _answerView.hidden = TRUE;
        _questionView.hidden = FALSE;
        _questionView.text = _myQuestion.question;
    }
}

-(void) swipeLeftDetected:(UITapGestureRecognizer *)sender
{
    if (_questionView.hidden == FALSE && _videoView.hidden == TRUE){
    _index = arc4random_uniform(_arraySize);//get random question
    _myQuestion = [_myArray objectAtIndex:_index];
    _questionView.text = _myQuestion.question;
    }
    NSLog(@"%d",_index);
}


-(void) swipeRightDetected:(UITapGestureRecognizer *)sender
{
    if (_questionView.hidden == FALSE && _videoView.hidden == TRUE){
    _index = arc4random_uniform(_arraySize);//get random question
    _myQuestion = [_myArray objectAtIndex:_index];
    _questionView.text = _myQuestion.question;
    }
    NSLog(@"%d",_index);
}

- (void)embedYouTube:(NSString *)urlString frame:(CGRect)frame {
    NSString *html = [NSString stringWithFormat:@"<html><body><iframe class=\"youtube-player\" type=\"text/html\" width=\"%f\" height=\"%f\" src=\'%@' allowfullscreen frameborder=\"0\" rel=nofollow></iframe></body></html>",frame.size.width,frame.size.height, urlString];
    [_videoView loadHTMLString:html baseURL:nil];
}

@end
