//
//  ViewController.m
//  aoc1_week4
//
//  Created by Monica Peters on 8/11/12.
//  Copyright (c) 2012 Web & Mobile Developer. All rights reserved.
//
//  Project Requirements & Rubric:
//  http://course.online.fullsail.edu/index.cfm?fuseaction=lms.activitiesDiscussion&activityId=798313&deliveryId=1603013

#import "ViewController.h"

#define LOGIN_BUTTON 0
#define DATE_BUTTON 1
#define INFO_BUTTON 2

@interface ViewController ()

@end

@implementation ViewController

//make the keyboard go away 
//when the user is done entering their username
// tutorial: http://www.youtube.com/watch?v=7-QFzN-p7oU&feature=channel
// wip not working yet as of aug 24th 2012
// to do: textinput / tapbackground call to goawaykeyboard

-(IBAction) goAwayKeyboard: (id) sender {
    //method to make that keyboard go away
    //keyboard is the first responder
    //resign will get rid of it
    [sender resignFirstResponder];
}


- (void)viewDidLoad
{
   
	self.view.backgroundColor = [UIColor whiteColor];
    
    //username label first on the top left, black font
    userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 20.0f, 90.0f, 30.0f)];
    if (userNameLabel != nil)
    {
        userNameLabel.text = @"Username:";
        userNameLabel.textAlignment = UITextAlignmentLeft;
        userNameLabel.textColor = [UIColor blackColor];
    }
    [self.view addSubview:userNameLabel];
    
    //username input first on top right rounded rectangle
    userNameInput = [[UITextField alloc] initWithFrame:CGRectMake(100.0f, 10.0f, 200.0f, 30.0f)];
    if (userNameInput != nil)
    {
        userNameInput.borderStyle = UITextBorderStyleRoundedRect;
        [self.view addSubview:userNameInput];
        [userNameInput resignFirstResponder];
    }
    
    //login button on right with blue text font
    //under the login label and input
    loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    if (loginButton != nil)
    {
        loginButton.tag = LOGIN_BUTTON;
        loginButton.frame = CGRectMake(220.0f, 50.0f, 75.0f, 35.0f);
        loginButton.tintColor = [UIColor blueColor];
        [loginButton setTitle:@"Login" forState:UIControlStateNormal];
        [loginButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:loginButton];
    }
    

    // text enduser enters into username field
    // at top of screen
    userNameText = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 90.0f, 300.0f, 70.0f)];
    if (userNameText != nil)
    {
        userNameText.text = @"Please Enter Username";
        userNameText.backgroundColor = [UIColor grayColor];
        userNameText.textColor = [UIColor blueColor];
        userNameText.textAlignment = UITextAlignmentCenter;
    }
    [self.view addSubview:userNameText];
    
    // show date button at center of screen
    // under the login area
    showDateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    if (showDateButton != nil) {
        showDateButton.tag = DATE_BUTTON;
        showDateButton.frame = CGRectMake(10.0f, 200.0f, 100.0f, 35.0f);
        [showDateButton setTitle:@"Show Date" forState:UIControlStateNormal];
        loginButton.tintColor = [UIColor blueColor];
        [showDateButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:showDateButton];
    }
    
    // info button at bottom of screen
    infoButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    if (infoButton != nil) 
    {
        infoButton.tag = INFO_BUTTON;
        infoButton.frame = CGRectMake(10.0f, 280.0f, 25.0f, 25.0f);
        infoButton.tintColor = [UIColor orangeColor];
        [infoButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:infoButton];
    }
    
    //dev info at bottom of screen under info button
    //left centered, green font
    infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 305.0f, 300.0f, 70.0f)];
    if (infoLabel != nil)
    {
        [self.view addSubview:infoLabel];
    }

     [super viewDidLoad];
}

// declare onClick method in header file too
// in ViewController.h
-(void)onClick:(UIButton*)button
{
    // check tag. if empty prompt user to enter username
    if (button.tag == LOGIN_BUTTON && userNameInput.text == 0)
    {
        //show prompt on screen; ask for username to be entered.
        userNameText.text = @"Username cannot be empty.";
        userNameText.textColor = [UIColor orangeColor];
    }
    //check tag. if username was entered show username on screen
    //within 3 lines of text, under the username input field & button.
    else if (button.tag == LOGIN_BUTTON)
    {
        NSString *endUser = [[NSString alloc] initWithString:userNameInput.text];
        userNameText.text = [NSString stringWithFormat:@"User: '%@' has been logged in", endUser];
        userNameText.textColor = [UIColor blueColor];
        userNameText.numberOfLines = 3;
    }
    // if date button clicked get todays date
    else if (button.tag == DATE_BUTTON)
    {
        NSDate *date = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        // if date is not null
        if (dateFormatter != nil)
        {
            // format the current date view
            // January 20, 2012 12:00:00:AM
            // Eastern Daylight Time
            [dateFormatter setDateFormat:@"MMMM d, yyyy h:mm:s:a zzzz"];
            NSString* dateLabel = [dateFormatter stringFromDate:date];
            // set Date at top of alert popup
            // set current date on next line in popup
            // set OK button on next line in popup
            UIAlertView *dateAlertView = [[UIAlertView alloc] initWithTitle:@"Date" message:dateLabel delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            // if current date and alert popup is setup,
            // show current date in 
            // alert popup on the screen
            if(dateAlertView != nil)
            {
                [dateAlertView show];
            }
        }
    }
    // if info button is clicked
    // show dev info on screen
    // at bottom under the info button
    // in green text within 3 lines
    else if (button.tag == INFO_BUTTON)
    {
        infoLabel.text = @"This application was written by Monica Peters";
        infoLabel.textColor = [UIColor greenColor];
        infoLabel.numberOfLines = 3;
    }
}

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
