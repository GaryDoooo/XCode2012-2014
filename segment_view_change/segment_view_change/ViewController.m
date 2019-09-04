//
//  ViewController.m
//  segment_view_change
//
//  Created by Herrick Wang on 12-1-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

//@synthesize view1,view2;//,segcontrol;//,webview;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
-(void)printviews:(UIView*)view{
    
    UIView *v;
    
    if([view.subviews count] >0){
        for (int i=0;i<[view.subviews count];i++){
            v=[view.subviews objectAtIndex:i];
            NSLog(@"view index %d tag %d des:%@",i,v.tag,[v description]);
            [self printviews:v];
        }
    }
}

- (void)viewDidLoad
{
    //[segcontrol addTarget:self action:@selector(changeseg:) forControlEvents:UIControlEventValueChanged];
    NSURL *weburl=[NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest *webreq=[NSURLRequest requestWithURL:weburl];
    [webview loadRequest:webreq];
    [self printviews:view1];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)changeseg:(id)sender{//:(id)sender)changeseg:(id)sender{
    NSInteger page=segcontrol.selectedSegmentIndex;//[sender currentPage];
    
    if(page==0){
        view1.hidden = false;
        view2.hidden = true;
    }else {
        view1.hidden =true;
        view2.hidden =false;
    }
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
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
