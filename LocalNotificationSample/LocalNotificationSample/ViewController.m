//
//  ViewController.m
//  LocalNotificationSample
//
//  Copyright (c) 2013年 Personal. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (nonatomic, retain) IBOutlet UITextField *minutesTextField;
@property (nonatomic, retain) IBOutlet UIButton *startButton;

- (IBAction)tapButton:(id)sender;

@end

@implementation ViewController

@synthesize minutesTextField;
@synthesize startButton;

+ (id) viewController {
    Class class = [self class];
    return [[[class alloc] initWithNibName:NSStringFromClass(class) bundle:nil] autorelease];
}

- (void) dealloc {
    
    self.minutesTextField = nil;
    self.startButton = nil;
    
    [super dealloc];
}

- (IBAction)tapButton:(id)sender {
    
    if(sender == startButton) {

        UILocalNotification *localNotification = [[UILocalNotification alloc] init];
        if(localNotification == nil) {
            return;
        }
        
        NSInteger minutes = [minutesTextField.text integerValue] * 60;
        NSDate *fireDate = [[[NSDate alloc] initWithTimeInterval:minutes sinceDate:[NSDate date]] autorelease];
        
        localNotification.fireDate = fireDate;
        localNotification.timeZone = [NSTimeZone localTimeZone];
        
        localNotification.alertAction = @"title of notification";
        localNotification.alertBody = @"message of notification";
        
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        localNotification.applicationIconBadgeNumber = 3;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
        return;
    }
    
}

#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
