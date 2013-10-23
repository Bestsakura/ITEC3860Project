//
//  PRJRootViewController.m
//  project
//
//  Created by Thai Pham on 10/11/13.
//  Copyright (c) 2013 Thai Pham. All rights reserved.
//

#import "PRJRootViewController.h"
#import "PRJPracticeViewController.h"
#import "PRJQuizViewController.h"
#import "LearnViewController.h"


@interface PRJRootViewController ()

@end

@implementation PRJRootViewController

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
    //Allocate for the practice View
    //self.practiceController = [[PRJPracticeViewController alloc] initWithNibName:@"PRJPracticeViewController" bundle:nil];
    //Allocate for the Lerning view as default
    self.learningController = [[LearnViewController alloc]initWithNibName:@"LearnViewController" bundle:nil];

    //Add practiceViewController as subView of RootView
    //[self.view insertSubview:self.practiceController.view  atIndex:0];
    //add LearnViewController as subview of RootView
    [self.view insertSubview:self.learningController.view  atIndex:0];
    //init viewTitle varible that stores title of button pressed by user
    _viewTitle = [[NSString alloc] initWithFormat:@""];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)quizViewButton:(UIBarButtonItem *)sender {
    _viewTitle = @"quiz";
    [self.learningController.view removeFromSuperview];
    [self.practiceController.view removeFromSuperview];
    if(self.quizController.view.superview==nil){
        self.quizController = [[PRJQuizViewController alloc]initWithNibName:@"PRJQuizViewController" bundle:nil];
        [self.view insertSubview:self.quizController.view atIndex:0];
    }else{
        [self.quizController.view removeFromSuperview];
        self.quizController = [[PRJQuizViewController alloc]initWithNibName:@"PRJQuizViewController" bundle:nil];
        [self.view insertSubview:self.quizController.view atIndex:0];
    }
}
- (IBAction)learningViewButton:(UIBarButtonItem *)sender {
    _viewTitle = @"learning";
    [self.practiceController.view removeFromSuperview];
    [self.quizController.view removeFromSuperview];
    if(self.learningController.view.superview==nil){
        self.learningController = [[LearnViewController alloc] initWithNibName:@"LearnViewController" bundle:nil];
        [self.view insertSubview:self.learningController.view atIndex:0];
    }
}

- (IBAction)practiceViewButton:(UIBarButtonItem *)sender {
    _viewTitle = @"practice";
    [self.learningController.view removeFromSuperview];
    [self.quizController.view removeFromSuperview];
    if(self.practiceController.view.superview==nil){
        self.practiceController = [[PRJPracticeViewController alloc]initWithNibName:@"PRJPracticeViewController" bundle:nil];
        [self.view insertSubview:self.practiceController.view atIndex:0];
    }
}


@end
