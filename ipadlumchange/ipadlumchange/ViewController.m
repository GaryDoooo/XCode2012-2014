//
//  ViewController.m
//  ipadlumchange
//
//  Created by Herrick Wang on 12-1-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(IBAction)turnON_focusPoint:(id)sender{
    if(focusSwitcher.on){
        focuspoint.hidden=false;
    } else {
        focuspoint.hidden=true;
    }
}

-(void)changeBL:(float)BLsetting{
    lumslider.value = BLsetting;
    BLstepper.value = BLsetting;
    BLsetting_display_label.text=[NSString stringWithFormat:@"B.L. Setting: %3.0f%%",BLsetting*100];
    [[UIScreen mainScreen] setBrightness:BLsetting];
}

-(IBAction)sliderchangeBL:(id)sender{

    [self changeBL:lumslider.value];
}

-(IBAction)stepperchangeBL:(id)sender{
    [self changeBL:BLstepper.value];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self changeBL:0.5];

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
    [self changeBL:0.5];

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
    //if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return ((interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)||
                (UIDeviceOrientationPortrait==interfaceOrientation));
    //} else {
      //  return YES;
    //}
}

@end
