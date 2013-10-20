//
//  ArrayOfQuestion.h
//  project
//
//  Created by Thai Pham on 10/9/13.
//  Copyright (c) 2013 Thai Pham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArrayOfQuestion : NSMutableArray
-(NSMutableArray *)initArrayOfQuestion;
-(NSMutableArray *)createArrayOfQuestionFromFile;
-(NSMutableArray *)arrayOfQuestionForQuiz:(NSInteger)size;
@end
