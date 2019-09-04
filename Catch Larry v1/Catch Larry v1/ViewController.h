//
//  ViewController.h
//  Catch Larry v1
//
//  Created by Herrick Wang on 12-1-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UILabel *scorelabel;
    IBOutlet UIButton *startbutton;
    IBOutlet UIView *subbuttonview;
    IBOutlet UILabel *roundslabel;
    IBOutlet UISegmentedControl *diffcultysetting;
    IBOutlet UISlider *roundslider;
    
    int buttonindex[20];
    int wronghits,timing,rounds,goodhits;
    int difficulty,totalrounds;
    int showbutton;
    NSTimer *timer;
    UIView *tempv;
    BOOL ButtonwasHitted,roundsON;
}

@property(nonatomic, retain) UIView *subbuttonview;

- (IBAction)startrun:(id)sender;
-(IBAction)clicklarry:(id)sender;
-(IBAction)clickalant:(id)sender;
//-(IBAction)changediff:(id)sender;
-(IBAction)changerounds:(id)sender;

@end
