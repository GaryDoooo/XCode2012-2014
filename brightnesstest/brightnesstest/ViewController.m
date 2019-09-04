//
//  ViewController.m
//  brightnesstest
//
//  Created by Herrick Wang on 12-1-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

-(void) setbrightness:(float)brightness_setting
{
    //NSLog(@"%f brightness setting",brightness_setting);
    [[UIScreen mainScreen] setBrightness:brightness_setting];
    labeltime.text=[NSString stringWithFormat:@"%3.0f (Hours)",round(40.0f/(brightness_setting+0.3f))];
    labelbrightness.text = [NSString stringWithFormat:@"%3.0f (Nits)",round(300.0f*brightness_setting)];
   
}

-(IBAction)brightnesschange:(id)sender{
    //GSEventSetBacklightLevel(brightnessslider.value);  
//    [[UIScreen mainScreen] setBrightness:brightnessslider.value];
//    labeltime.text=[NSString stringWithFormat:@"%d (Hours)",round(40/(brightnessslider.value+0.3))];
//    labelbrightness.text = [NSString stringWithFormat:@"%d (Nits)",round(300*brightnessslider.value)];
    [self setbrightness:brightnessslider.value];
    
}
//:(id)sender

#pragma mark - View lifecycle

- (void)viewDidLoad
{
        //GSEventSetBacklightLevel(0.5);  
    [super viewDidLoad];
    [self setbrightness:brightnessslider.value];
	// Do any additional setup after loading the view, typically from a nib.
//    [[UIScreen mainScreen] setBrightness:brightnessslider.value];
//    labeltime.text=[NSString stringWithFormat:@"%d (Hours)",round(40/(brightnessslider.value+0.3))];
  //  labelbrightness.text = [NSString stringWithFormat:@"%d (Nits)",round(300*brightnessslider.value)];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    

}

@end
