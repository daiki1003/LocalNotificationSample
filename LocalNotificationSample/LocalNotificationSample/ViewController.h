//
//  ViewController.h
//  LocalNotificationSample
//
//  Copyright (c) 2013年 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate> {
    
    IBOutlet UITextField *minutesTextField;
    
    /** スタートするためのボタン */
    IBOutlet UIButton *startButton;
    
}

+ (id) viewController;

@end
