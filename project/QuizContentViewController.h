//
//  QuizContentViewController.h
//  project
//
//  Created by Thai Pham on 10/16/13.
//  Copyright (c) 2013 Thai Pham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizContentViewController : UIViewController
@property CGPoint firstTouch;
@property NSInteger lableNum;
@property (strong, nonatomic) IBOutlet UILabel *answerLable1;
@property (strong, nonatomic) IBOutlet UILabel *answerLable2;
@property (strong, nonatomic) IBOutlet UILabel *answerLable3;
@property (strong, nonatomic) IBOutlet UILabel *answerLable4;
@property (strong, nonatomic) IBOutlet UILabel *answerBoxLable;


@end
