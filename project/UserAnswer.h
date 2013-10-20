//
//  UserAnswer.h
//  project
//
//  Created by Thai Pham on 10/19/13.
//  Copyright (c) 2013 Thai Pham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserAnswer : NSObject
@property (nonatomic,strong) NSString* question;
@property (nonatomic,strong) NSString* userAnswer;
@property (nonatomic,strong) NSString* correctAnswer;
@property NSInteger point;
@end
