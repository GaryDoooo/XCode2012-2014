//
//  ViewController.h
//  iPAD_C51_comm
//
//  Created by GDu on 13-3-10.
//  Copyright (c) 2013年 GDu. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <sys/time.h>

@interface ViewController : UIViewController
{
    IBOutlet UISegmentedControl *segmentinput;
    IBOutlet UIButton *touch_input_button;
    IBOutlet UIButton *white_block;
    IBOutlet UILabel *textbox;
    
    IBOutlet UILabel *label1;
    IBOutlet UILabel *label2;
    
    NSTimer *timer;
    NSTimer *timer_global;
    int repeat_time,white_box_timer; //white box change times
    //struct timeval systime,time_last_buttom,time2;
    int button_input;
    long time_last_buttom,time2;
    
}

-(IBAction)ipadinput_at_segment:(id)sender;
-(IBAction)touchinput:(id)sender;
//-(IBAction)turnON_focusPoint:(id)sender;

@end
