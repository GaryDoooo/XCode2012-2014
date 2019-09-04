//
//  ViewController.h
//  brightnesstest
//
//  Created by Herrick Wang on 12-1-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIkit/UIScreen.h"

//#import <UIKit/UIApplication.h>
//#import <MediaPlayer/MediaPlayer.h>
//#import <GraphicsServices/GraphicsServices.h>
//#import "GraphicsServices.h"

//void GSEventSetBacklightFactor(int factor); 
//extern void GSEventSetBacklightLevel(float level);
//void GSEventSetBacklightLevel(float level); // from 0.0 (off) to 1.0 (max)
//void setBacklightLevel(float fp8);

//#define SUPPORTS_IOKIT_EXTENSIONS    1

@interface ViewController : UIViewController{
    IBOutlet UISlider *brightnessslider;
    IBOutlet UILabel *labelbrightness;
    IBOutlet UILabel *labeltime;
    /////////////ipad part/////////
    IBOutlet UIStepper *lu
    
    //IBOutlet UIScreen *screen;
    
}

-(IBAction) brightnesschange:(id)sender;

@end
