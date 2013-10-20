//
//  QuizContentViewController.m
//  project
//
//  Created by Thai Pham on 10/16/13.
//  Copyright (c) 2013 Thai Pham. All rights reserved.
//

#import "QuizContentViewController.h"

@interface QuizContentViewController ()

@end

@implementation QuizContentViewController

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
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panDetected:)];
    [self.view addGestureRecognizer:pan];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    _firstTouch= [touch locationInView:touch.view];

}
-(void)panDetected:(UIPanGestureRecognizer *)sender 
{
    //translationInView method returns the amount by which user's finger has moved on the screen

    CGPoint amtOfTranslation = [sender translationInView:self.view];

    if (CGRectContainsPoint(self.answerLable1.frame, _firstTouch)){
        _lableNum = 1;
    }else if (CGRectContainsPoint(self.answerLable2.frame, _firstTouch)){
        _lableNum = 2;
    }else if (CGRectContainsPoint(self.answerLable3.frame, _firstTouch)){
        _lableNum = 3;
    }else if (CGRectContainsPoint(self.answerLable4.frame, _firstTouch)){
        _lableNum = 4;
    }else{
       // _lableNum = 0;
    }
    
    
    if(_lableNum == 1){
        CGPoint imageViewPosition = self.answerLable1.center;
        CGPoint originalPoint = self.answerLable1.center;
        imageViewPosition.x = imageViewPosition.x + amtOfTranslation.x;
        imageViewPosition.y = imageViewPosition.y + amtOfTranslation.y;
        self.answerLable1.center = imageViewPosition;
        [sender setTranslation:CGPointZero inView:self.view];
        //testing
        if(CGRectContainsPoint(self.answerBoxLable.frame, self.answerLable1.center)){
            self.answerLable1.center = self.answerBoxLable.center;
            [sender setTranslation:CGPointZero inView:self.view];
        }
        NSLog(@"%f %f",imageViewPosition.x,imageViewPosition.y);
        //self.answerLable1= CGAffineTransformIdentity;
        
    }else if(_lableNum == 2){
        CGPoint imageViewPosition = self.answerLable2.center;
        imageViewPosition.x = imageViewPosition.x + amtOfTranslation.x;
        imageViewPosition.y = imageViewPosition.y + amtOfTranslation.y;
        self.answerLable2.center = imageViewPosition;
        [sender setTranslation:CGPointZero inView:self.view];

    }else if (_lableNum == 3){
        CGPoint imageViewPosition = self.answerLable3.center;
        imageViewPosition.x = imageViewPosition.x + amtOfTranslation.x;
        imageViewPosition.y = imageViewPosition.y + amtOfTranslation.y;
        self.answerLable3.center = imageViewPosition;
        [sender setTranslation:CGPointZero inView:self.view];
    }else if (_lableNum == 4){
        CGPoint imageViewPosition = self.answerLable4.center;
        imageViewPosition.x = imageViewPosition.x + amtOfTranslation.x;
        imageViewPosition.y = imageViewPosition.y + amtOfTranslation.y;
        self.answerLable4.center = imageViewPosition;
        [sender setTranslation:CGPointZero inView:self.view];
    }
   
     
}

@end
