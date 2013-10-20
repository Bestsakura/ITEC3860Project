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

 -(NSMutableArray *)initArrayOfQuestion
 {
 NSMutableArray *questionArray = [[NSMutableArray alloc] init];
 
 Question *question1 =[[Question alloc]init];
 question1.question = @"The following data are all examples of ___________? 72, 'A', Hello World, 2. 8712";
 question1.answer1 = @"String";
 question1.answer2 = @"Literals";
 question1.answer3 = @"Variables";
 question1.answer4 = @"None of these";
 question1.hint = @"Review variable section";
 question1.example = @"Variables are any and all values.";
 question1.correctAnswer = @"Variables";
 [questionArray addObject:question1];

     Question *question2 =[[Question alloc]init];
     question2.question = @"A variable must be declared before it can be used.";
     question2.answer1 = @"Sometimes";
     question2.answer2 = @"Yes";
     question2.answer3 = @"No";
     question2.answer4 = @"Depend";
     question2.hint = @"Does a variable need a type before it can be used?";
     question2.example = @"Before a variable can be used it must be declared as a type.";
     question2.correctAnswer = @"Yes";
     [questionArray addObject:question2];
 
 Question *question3 =[[Question alloc]init];
 question3.question = @"Which one of these is an incorrect variable name.";
 question3.answer1 = @"PrinceHamlet";
 question3.answer2 = @"thatIsTheQuestion";
 question3.answer3 = @"longLiveTheKing";
 question3.answer4 = @"2BeOrNotToBe";
 question3.hint = @"Is 2b mathmatical or the name of a variable?";
 question3.example = @"Whats the difference between b = 1d and b = 1 * d ? There isnt a difference.";
 question3.correctAnswer = @"2BeOrNotToBe";
 [questionArray addObject:question3];
     
     Question *question4 =[[Question alloc]init];
     question4.question = @"What keyword in variable decleration stops the variable from being changed.";
     question4.answer1 = @"private";
     question4.answer2 = @"public";
     question4.answer3 = @"final";
     question4.answer4 = @"static";
     question4.hint = @"What key word creates constants?";
     question4.example = @"Use the keyword 'final' to create constants.";
     question4.correctAnswer = @"final";
     [questionArray addObject:question4];
     
     Question *question5 =[[Question alloc]init];
     question5.question = @"What is the value of a?   int a, x = 23;    a = x % 2;";
     question5.answer1 = @"2";
     question5.answer2 = @"1";
     question5.answer3 = @"0";
     question5.answer4 = @"11";
     question5.hint = @"Remeber % is the module operator";
     question5.example = @"The module operator is used to find remainders.";
     question5.correctAnswer = @"1";
     [questionArray addObject:question5];
     
     Question *question6 =[[Question alloc]init];
     question6.question = @"What type of variable has a value of either true or false.";
     question6.answer1 = @"String";
     question6.answer2 = @"Binary";
     question6.answer3 = @"Integer";
     question6.answer4 = @"Boolean";
     question6.hint = @"What variable is used for conditionals?";
     question6.example = @"Booleans are often used for conditional statements.";
     question6.correctAnswer = @"Boolean";
     [questionArray addObject:question6];
     
     Question *question7 =[[Question alloc]init];
     question7.question = @"&&, | |, and ! are ________ ?";
     question7.answer1 = @"Logical operators";
     question7.answer2 = @"conditional operators";
     question7.answer3 = @"mathmatical operators";
     question7.answer4 = @"ternary operators";
     question7.hint = @"&& = AND, | | = OR, ! = NOT";
     question7.example = @"if x =1 && x = 2 is always false. This is a logical statement. ";
     question7.correctAnswer = @"Logical operators";
     [questionArray addObject:question7];
     
     Question *question8 =[[Question alloc]init];
     question8.question = @"The conditional operator takes how many operands?";
     question8.answer1 = @"4";
     question8.answer2 = @"3";
     question8.answer3 = @"2";
     question8.answer4 = @"1";
     question8.hint = @">, <=, ==, != are all conditional operators";
     question8.example = @"value1 > value2";
     question8.correctAnswer = @"2";
     [questionArray addObject:question8];
     
     Question *question9 =[[Question alloc]init];
     question9.question = @"The '=' operator and the '==' operator perform the same operation.";
     question9.answer1 = @"No";
     question9.answer2 = @"Yes";
     question9.answer3 = @"Sometimes";
     question9.answer4 = @"Depend";
     question9.hint = @"Are the statements 'value 1 = value 2' and 'value1 == value 2' the same?";
     question9.example = @"'=' is a mathmatical operator and used to set variables. '==' is a conditional operator and used to compare";
     question9.correctAnswer = @"Yes";
     [questionArray addObject:question9];
     
     Question *question10 =[[Question alloc]init];
     question10.question = @"The number 1235.124 is what type of variable?";
     question10.answer1 = @"Integer";
     question10.answer2 = @"String";
     question10.answer3 = @"Long";
     question10.answer4 = @"Double";
     question10.hint = @"An integer and long variable type are similar to each other. ";
     question10.example = @"double x = 20.12; int y = 20; string z = 'twenty'; long q = 20;";
     question10.correctAnswer = @"Double";
     [questionArray addObject:question10];
     
     Question *question11 =[[Question alloc]init];
     question11.question = @"When declaring a String variable, what goes around the string?";
     question11.answer1 = @"'' ''";
     question11.answer2 = @"( )";
     question11.answer3 = @"[ ]";
     question11.answer4 = @"{ }";
     question11.hint = @"Answer is  NOT < >";
     question11.example = @"String x = hello;         What is this missing?";
     question11.correctAnswer = @"'' ''";
     [questionArray addObject:question11];
     
     Question *question12 =[[Question alloc]init];
     question12.question = @"Can you declare an empty String?";
     question12.answer1 = @"No";
     question12.answer2 = @"Sometimes";
     question12.answer3 = @"Yes";
     question12.answer4 = @"Depend";
     question12.hint = @"Checking for a null value is used for finding errors.";
     question12.example = @"String x = " ";";
     question12.correctAnswer = @"Yes";
     [questionArray addObject:question12];
     
 return questionArray;
 }

-(NSMutableArray *)createArrayOfQuestionFromFile{
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
            questionI.hint = @"";
            questionI.example = @"";
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
