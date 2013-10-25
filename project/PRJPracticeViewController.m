//
//  PRJPracticeViewController.m
//  project
//
//  Created by Thai Pham on 10/24/13.
//  Copyright (c) 2013 Thai Pham. All rights reserved.
//

#import "PRJPracticeViewController.h"
#import "PracticeViewController.h"

@interface PRJPracticeViewController ()

@end

@implementation PRJPracticeViewController

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

- (IBAction)goButton:(UIButton *)sender {
    self.practiceController = [[PracticeViewController alloc]initWithNibName:@"PracticeViewController" bundle:nil];
    [self.view insertSubview:self.practiceController.view atIndex:0];
    _guide.hidden = TRUE;
    _answer.hidden = TRUE;
    _answerBox.hidden = TRUE;
    _imgTouch.hidden = TRUE;
    _imgArrow.hidden = TRUE;
    _goButton.hidden = TRUE;
    _navTitle.hidden = TRUE;
}
@end
