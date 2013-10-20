//
//  Question.h
//  project
//
//  Created by Thai Pham on 10/7/13.
//  Copyright (c) 2013 Thai Pham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject
@property (nonatomic,strong) NSString* question;
@property (nonatomic,strong) NSString* answer1;
@property (nonatomic,strong) NSString* answer2;
@property (nonatomic,strong) NSString* answer3;
@property (nonatomic,strong) NSString* answer4;
@property (nonatomic,strong) NSString* hint;
@property (nonatomic,strong) NSString* example;
@property (nonatomic,strong) NSString* animationLink;
@property (nonatomic,strong) NSString* correctAnswer;
//@property NSInteger correctAnswer;

@end
