//
//  ArrayOfQuestion.m
//  project
//
//  Created by Thai Pham on 10/9/13.
//  Copyright (c) 2013 Thai Pham. All rights reserved.
//

#import "ArrayOfQuestion.h"
#import "Question.h"

@implementation ArrayOfQuestion

//This method aims to get questions in a text file and put into an array which is used for learning and practice session
 -(NSMutableArray *)initArrayOfQuestion{
     NSMutableArray *questionArray = [[NSMutableArray alloc] init];
     //Read data from file coding here...
     //Open the file stored in the project's folder (mainBundle). Read all contents of the file in a string object.
     NSString *fileContents = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"questionsbank" ofType:@"txt"] encoding:NSUTF8StringEncoding error: nil];
     //Create a NSScanner object using the text read
     NSScanner *theScanner = [NSScanner scannerWithString:fileContents];
     
     //Newline separates lines.
     NSCharacterSet *lineSeparator = [NSCharacterSet newlineCharacterSet];
     NSString *line; // Store each new line into this
     NSString *question;
     NSString *answer1;
     NSString *answer2;
     NSString *answer3;
     NSString *answer4;
     NSString *correct;
     NSString *hint;
     NSString *example;
     NSString *topic;
     NSString *link;
     
     int counter = 0; // Count the number of lines
     // While the scanner has not reached the end of the text read
     while(![theScanner isAtEnd])
     {
         //scan everything into the string object until you reach the line separator
         [theScanner scanUpToCharactersFromSet:lineSeparator intoString:&line];
         
         if(counter%10==0){
             question = [NSString stringWithFormat:@"%@ \n",line];
         }
         if(counter%10==1){
             answer1 = [NSString stringWithFormat:@"%@ \n",line];
         }
         if(counter%10==2){
             answer2 = [NSString stringWithFormat:@"%@ \n",line];
         }
         if(counter%10==3){
             answer3 = [NSString stringWithFormat:@"%@ \n",line];
         }
         if(counter%10==4){
             answer4 = [NSString stringWithFormat:@"%@ \n",line];
         }
         if(counter%10==5){
             correct = [NSString stringWithFormat:@"%@ \n",line];
         }
         if(counter%10==6){
             hint = [NSString stringWithFormat:@"%@ \n",line];
         }
         if(counter%10==7){
             example = [NSString stringWithFormat:@"%@ \n",line];
         }
         if(counter%10==8){
             topic = [NSString stringWithFormat:@"%@ \n",line];
         }
         if(counter%10==9){
             link = [NSString stringWithFormat:@"%@ \n",line];
             Question *questionI =[[Question alloc]init];
             questionI.question = question;
             questionI.answer1 = answer1;
             questionI.answer2 = answer2;
             questionI.answer3 = answer3;
             questionI.answer4 = answer4;
             questionI.correctAnswer = correct;
             questionI.hint = hint;
             questionI.example = example;
             [questionArray addObject:questionI];
         }
         counter++;
     }

     return questionArray;
}

//This method aims to get questions in a text file and put into an array which is used for quiz session
-(NSMutableArray *)createArrayOfQuestionFromFile{
    NSMutableArray *questionArray = [[NSMutableArray alloc] init];
    
    //Read data from file coding here...
    //Open the file stored in the project's folder (mainBundle). Read all contents of the file in a string object.
    NSString *fileContents = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"questionsbank4quiz" ofType:@"txt"] encoding:NSUTF8StringEncoding error: nil];
    //Create a NSScanner object using the text read
    NSScanner *theScanner = [NSScanner scannerWithString:fileContents];

    //Newline separates lines.
    NSCharacterSet *lineSeparator = [NSCharacterSet newlineCharacterSet];
    NSString *line; // Store each new line into this
    NSString *question;
    NSString *answer1;
    NSString *answer2;
    NSString *answer3;
    NSString *answer4;
    NSString *correct;
    
    int counter = 0; // Count the number of lines
    // While the scanner has not reached the end of the text read
    while(![theScanner isAtEnd])
    {
        //scan everything into the string object until you reach the line separator
        [theScanner scanUpToCharactersFromSet:lineSeparator intoString:&line];

        if(counter%6==0){
            question = [NSString stringWithFormat:@"%@ \n",line];
        }
        if(counter%6==1){
            answer1 = [NSString stringWithFormat:@"%@ \n",line];
        }
        if(counter%6==2){
            answer2 = [NSString stringWithFormat:@"%@ \n",line];
        }
        if(counter%6==3){
            answer3 = [NSString stringWithFormat:@"%@ \n",line];
        }
        if(counter%6==4){
            answer4 = [NSString stringWithFormat:@"%@ \n",line];
        }
        if(counter%6==5){
            correct = [NSString stringWithFormat:@"%@ \n",line];
            Question *questionI =[[Question alloc]init];
            questionI.question = question;
            questionI.answer1 = answer1;
            questionI.answer2 = answer2;
            questionI.answer3 = answer3;
            questionI.answer4 = answer4;
            //questionI.hint = @"";
            //questionI.example = @"";
            questionI.correctAnswer = correct;
            [questionArray addObject:questionI];
        }
        counter++;
    }
    return questionArray;
}

-(NSMutableArray *)arrayOfQuestionForQuiz:(NSInteger)size{
    NSInteger i;
    NSInteger j;
    BOOL ok;
    NSInteger index;
    //create question bank
    NSMutableArray *questionBank = [[NSMutableArray alloc] init];
    //get questions from function initArryOfQuestion
    //questionBank = self.initArrayOfQuestion;//get from old hard coding method
    questionBank = self.createArrayOfQuestionFromFile;//from file
    //get the size of question bank
    NSInteger bankSize = 0;
    for(id obj in questionBank){
        bankSize++;
    }
    
   
    NSMutableArray *questionArray = [[NSMutableArray alloc] init];
    NSInteger indexArray[size];
    index = arc4random_uniform(bankSize);
    indexArray[0]=index;
    for (i =1; i<size;) {
        ok=TRUE;
        index = arc4random_uniform(bankSize);
        for(j=0; j<i; j++){
            if(indexArray[j]==index){
                ok=FALSE;
            }
        }
        if(ok==TRUE){
            indexArray[i]=index;
            i++;
        }
    }
    
    for(i=0;i<size;i++){
        [questionArray addObject:[questionBank objectAtIndex:indexArray[i]]];
    }
    return questionArray;
}

@end
