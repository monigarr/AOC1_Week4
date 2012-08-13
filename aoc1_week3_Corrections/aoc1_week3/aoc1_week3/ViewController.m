//
//  ViewController.m
//  aoc1_week3
//
//  Created by Monica Peters on 8/5/12.
//  Copyright (c) 2012 Web & Mobile Developer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    // 6. Call the Add function passing in two integer values. Capture the return of this function into a variable.
    int sum = [self add:33 with:11];
    
    // 7. Bundle the returned integer into an NSNumber and then convert it to a NSString and pass it to the DisplayAlertWithString function.
    NSNumber *numberSum = [[NSNumber alloc] initWithInt:sum];
    
    // 8. Give it some text for the title. The message will read, "The number is 00". Replace the 00 with the integer passed into the function.
    NSString *theNumberText = [NSString stringWithFormat:@"The number is "];
    NSString *numberToString = [numberSum stringValue];
    NSString *myNumberAddString = [self append:theNumberText with:numberToString];
    [self displayAlertWithString:myNumberAddString];    
    
    
    //9. Call the Compare function with two integer values. If Compare returns YES, display an UIAlertView both with the input values and the result using the DisplayAlertWithString function.
    int int1 = 7;
    int int2 = 11;
    BOOL compareNumber = [self compare:int1 with:int2];
    NSString *compareString = [NSString stringWithFormat:@"Numbers %d and %d are equal? %@", int1, int2, compareNumber?@"YES":@"NO"];
    [self displayAlertWithString:compareString];
    [self displayAlertWithString:myNumberAddString];
    
    // 4. Call the Append function with two NSStrings. 
    // 4. Capture the result and display a UIAlertView with the appended string using displayAlertWithString.
    NSString *appendString = [self append:@"Monica " with:@"Peters"];
    [self displayAlertWithString:appendString];
} //end viewDidLoad

    // 1. Create a function called Add.
    -(int)add:(int)number1 with:(int)number2 
    {
        //take two NSInteger or int types
        //return result of an addition between these two. 
        return number1 + number2;
    }
    
    // 2. Create a BOOL function called Compare that takes two NSInteger values. 
    -(BOOL)compare:(int)number1 with:(int)number2
    {
       //Return YES or NO based on whether the values are equal.
        if (number1 == number2)
        {
            return YES;
        }
        else
        {
            return NO;
        }
    }

    // 3. Create a function called Append take two NSStrings. 
    -(NSString *)append:(NSString *)string1 with:(NSString *)string2
    {
        //return a new NSString containing the appended strings using an NSMutableString and the Append method.
        NSMutableString *appendedString = [NSMutableString stringWithString:string1];
        NSString *string = [appendedString stringByAppendingString:string2];
        return string;
    }
    
    // 5. DisplayAlertWithString Function
    -(void)displayAlertWithString:(NSString *)string 
    {
        //http://forums.macrumors.com/showthread.php?t=1084173
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:string delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        //Take the passed in NSString and display it in the alert view.
        [alert show];
    }
     
    
    //[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
