//
//  ViewController.h
//  slider
//
//  Created by Herrick Wang on 12-1-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate> {
    IBOutlet UITextField *text;
    IBOutlet UILabel *label;
    IBOutlet UIButton *button;
    IBOutlet UIButton *button2;
    //button.hidden = true;
}

-(IBAction)clickButton:(UIButton*)sender;
-(IBAction)changeImage:(UIButton*)sender;

@end
