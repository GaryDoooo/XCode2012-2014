//
//  ViewController.h
//  ipadlumchange
//
//  Created by Herrick Wang on 12-1-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UISlider *lumslider;
    IBOutlet UILabel *focuspoint;
    IBOutlet UILabel *BLsetting_display_label;
    IBOutlet UISwitch *focusSwitcher;
    IBOutlet UIStepper *BLstepper;
}

-(IBAction)sliderchangeBL:(id)sender;
-(IBAction)stepperchangeBL:(id)sender;
-(IBAction)turnON_focusPoint:(id)sender;

@end
