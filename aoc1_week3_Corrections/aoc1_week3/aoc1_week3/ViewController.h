//
//  ViewController.h
//  aoc1_week3
//
//  Created by Monica Peters on 8/5/12.
//  Copyright (c) 2012 Web & Mobile Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

    -(int)add:(int)number1 with:(int)number2;
    -(BOOL)compare:(int)number1 with:(int)number2;
    -(NSString*)append:(NSString*)string1 with:(NSString*)string2;
    -(void)displayAlertWithString:(NSString*)string;
    -(int)sum;
    -(int)add;
    -(int)number1;
    -(int)number2;
@end
