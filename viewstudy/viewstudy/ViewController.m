//
//  ViewController.m
//  viewstudy
//
//  Created by Herrick Wang on 12-1-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize imageview1,imageview2,pagecontrol;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [imageview1 setImage:[UIImage imageNamed:@"OrangeV1.tif"]];
    tempimage =imageview1;
    
    imageview1.hidden=false;
    imageview2.hidden=true;
    
    [pagecontrol addTarget:self action:@selector(pageTuning:) forControlEvents:UIControlEventValueChanged];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

//-(void)pageTuning: (UIPageControl *) pagecontroller{
-(void)pageTuning: (id) sender{
    NSInteger nextpage = [sender currentPage];
        
    if (tempimage.tag ==0){
        tempimage = imageview2;
        bgimage = imageview1;
    } else {
        tempimage = imageview1;
        bgimage =imageview2;
    }
    
    if (nextpage == 1) {
        [tempimage setImage:[UIImage imageNamed:@"OrangeV1.tif"]];
    } if (nextpage == 0) {
        [tempimage setImage:[UIImage imageNamed:@"lightning.tif"]];
    }
    
    [UIView beginAnimations:@"flipping view" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                           forView:tempimage cache:YES];
    [tempimage setHidden:YES]; 
    [UIView commitAnimations];
    [UIView beginAnimations:@"flipping view" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                           forView:bgimage cache:YES];
    [bgimage setHidden:NO]; 
    [UIView commitAnimations];
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
