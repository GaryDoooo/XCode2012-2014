//
//  ViewController.h
//  segment_view_change
//
//  Created by Herrick Wang on 12-1-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UIView *view1;
    IBOutlet UIView *view2;
    IBOutlet UISegmentedControl *segcontrol;
    IBOutlet UIWebView *webview;
    
}

-(IBAction)changeseg:(id)sender;
//@property (nonatomic, retain) UIView *view1;
//@property (nonatomic, retain) UIView *view2;
//@property (nonatomic, retain) UISegmentedControl *segcontrol;
//@property (nonatomic, retain) UIWebView *webview;

@end
