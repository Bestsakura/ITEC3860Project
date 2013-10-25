//
//  PRJLearnViewController.m
//  project
//
//  Created by Thai Pham on 10/24/13.
//  Copyright (c) 2013 Thai Pham. All rights reserved.
//

#import "PRJLearnViewController.h"
#import "LearnViewController.h"

@interface PRJLearnViewController ()

@end

@implementation PRJLearnViewController

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

- (IBAction)startButton:(UIButton *)sender {
    self.learnController = [[LearnViewController alloc]initWithNibName:@"LearnViewController" bundle:nil];
    [self.view insertSubview:self.learnController.view atIndex:0];
    _imgView.hidden = TRUE;
    _startButton.hidden = TRUE;
}
@end
