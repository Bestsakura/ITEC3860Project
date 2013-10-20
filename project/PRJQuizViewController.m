//
//  PRJQuizViewController.m
//  project
//
//  Created by Thai Pham on 10/14/13.
//  Copyright (c) 2013 Thai Pham. All rights reserved.
//

#import "PRJQuizViewController.h"
#import "QuizViewController.h"

@interface PRJQuizViewController ()

@end

@implementation PRJQuizViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startQuizButton:(UIButton *)sender {
    self.quizController = [[QuizViewController alloc]initWithNibName:@"QuizViewController" bundle:nil];
    [self.view insertSubview:self.quizController.view atIndex:0];
    _imageQuizView.hidden = TRUE;
    _startQuizButton.hidden = TRUE;
    _navigationBarTitle.hidden = TRUE;
}
@end
