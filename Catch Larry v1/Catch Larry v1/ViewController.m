//
//  ViewController.m
//  Catch Larry v1
//
//  Created by Herrick Wang on 12-1-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize subbuttonview;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    int j=0;
    //UIView *tempv;
    for(int i=0;i<[subbuttonview.subviews count];i++){
        tempv=[subbuttonview.subviews objectAtIndex:i];
        NSLog(@"found view.subview index:%d",i);
        if(tempv.tag > 99) {
            buttonindex[j++]=i;
            tempv.hidden = true;
        }
    }
    NSLog(@"buttonindex found:%d",j);
    subbuttonview.hidden = true;
    
    totalrounds =9;
    difficulty =1;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)stoprun{
    NSString *comment;
    
    //stop timer.....
    [timer invalidate];
    
    //int minscore=1000-75*(totalrounds-1);
    //score=(score-minscore)*100/(maxscore-minscore);
    
    totalrounds++;
    int misshits=totalrounds-goodhits-wronghits;
    NSString *hitboard=[NSString stringWithFormat:@" Good hits: %d\n Wrong hits: %d\n Missing: %d\n",
                                goodhits,wronghits,misshits];
    NSLog(@"%@",hitboard);
    
    int score = 100*(goodhits-wronghits)/totalrounds;
    
    scorelabel.text = [NSString stringWithFormat:
                       @"Final score(max=100): %d",score];
    if(score>90){
        comment =[NSString stringWithFormat:@"You CHEAT..."];
    }else if(score >75){
        comment =[NSString stringWithFormat:@"Good Play"];        
    } else if(score>60){
        comment =[NSString stringWithFormat:
                  @"Passed. Try again."]; 
    }else if(score >30){
        comment =[NSString stringWithFormat:
                  @"Failed Try again..."];
    } else {
        comment =[NSString stringWithFormat:
                  @"Big room to improve"];
    }
    //[hitboard appendString:comment];
    hitboard=[NSString stringWithFormat:@"%@\n %@",hitboard,comment];
    NSLog(@"%@",hitboard);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You...." 
                message:hitboard
                delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
    //animation back
    [UIView beginAnimations:@"flipping view" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromRight
                           forView:subbuttonview cache:YES];
    [subbuttonview setHidden:YES];
    [UIView commitAnimations];
    
}

-(void)roundstart{
    showbutton = (showbutton+ rand()%17+1) % 18;
    tempv=[subbuttonview.subviews 
           objectAtIndex:buttonindex[showbutton]];
     ButtonwasHitted = false;
     tempv.hidden=false;
    roundsON = true;
}

-(void)roundstop{
    //timing=0; 
    if(roundsON){
        tempv.hidden=true;
        if(ButtonwasHitted && tempv.tag <109) goodhits++; //hit Larry
        if(ButtonwasHitted && tempv.tag >109) wronghits ++; //hit Alant
        if(totalrounds == rounds) [self stoprun];
        
        if((!ButtonwasHitted) && tempv.tag >109) rounds --; //miss Alant
        rounds ++;
        roundsON = false;
        
    }
          /*if(tempv.tag <110){
                   score = score - 50;
                   } else {
                   score = score + 100;
                   }*/
    /*            //if(tempv.tag >109) totalhits++; //if missed Alant, one more good hit.
     if((!ButtonwasHitted)&&tempv.tag >109) rounds --; //if Alant showed, round not count
     if(totalrounds==rounds++) [self stoprun];
     }*/

}

-(void)onTimer{
    
    if(timing == 0) [self roundstart];
    if(timing == 4) [self roundstop];
    timing++;
    if(timing == 5) timing=0;
    
    //int showbutton;
    
    /*if(timing>=0) {
        score = score - 10;
        //maxscore = maxscore -10;
    }
    scorelabel.text = [NSString stringWithFormat:
                       @"Score: %d",score];
     */
/*    switch (timing++) {
        case 5:
        {
         showbutton = rand() % 18;
        tempv=[subbuttonview.subviews 
                   objectAtIndex:buttonindex[showbutton]];
          if(tempv.tag <110) {
                maxscore = maxscore + 50;
            } else {
                maxscore =maxscore - 50;
            }*/
/*            //ButtonisON = false;
            ButtonwasHitted = false;
            tempv.hidden=false;
            timing =0;
        }
            break;
        case 4:{
            //timing=0; 
            tempv.hidden=true;
*/            /*if(tempv.tag <110){
                score = score - 50;
            } else {
                score = score + 100;
            }*/
/*            //if(tempv.tag >109) totalhits++; //if missed Alant, one more good hit.
            if((!ButtonwasHitted)&&tempv.tag >109) rounds --; //if Alant showed, round not count
            if(totalrounds==rounds++) [self stoprun];
        }
            break;
        default:
            break;
    }
*/
}

- (IBAction)startrun:(id)sender{
    //int showbutton;
    //UIView *tempv;
    float timeinterval;
    
    //score = 1000; maxscore =1000 + (totalrounds +1)*50;
    //scorelabel.text = [NSString stringWithFormat:
    //                   @"Score: %d",score];
    //subbuttonview.hidden = false;
    [UIView beginAnimations:@"flipping view" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromRight
     forView:subbuttonview cache:YES];
    //[self.view​removeFromSuperview];​​​​
    //[UIView commitAnimations];
    [subbuttonview setHidden:NO];
    [UIView commitAnimations];
    
    switch (diffcultysetting.selectedSegmentIndex) {
        case 0: //Easiest
            timeinterval=0.33;
            break;
        case 1:
            timeinterval=0.17;
            break;
        case 2:
            timeinterval=0.12;
            break;
        default: //Hardest
            timeinterval=0.08;
            break;
    }
    // Start Timer...
    timer = [NSTimer scheduledTimerWithTimeInterval:timeinterval
             //0.08*(4-diffcultysetting.selectedSegmentIndex) 
                                             target:self
                                   selector:@selector(onTimer)
                                   userInfo:nil
                                    repeats:YES];
    timing = -10; rounds=0; goodhits=0; wronghits =0;
    
    srand(time(0)); //feed random seed to rand()
    totalrounds = (int)roundslider.value - 1;

    
    //[self.view ];
    //[self view];
    
    /*for (int i=0;i<10;i++){
        showbutton = rand() % 18; //rand is int radom number
        NSLog(@"show button index: %d",showbutton);
        tempv=[subbuttonview.subviews 
               objectAtIndex:buttonindex[showbutton]];
        tempv.hidden=false;
        for(int j=0;j<1000000;j++)for(int k=0;k<10000;k++);
        tempv.hidden=true;
    }

    subbuttonview.hidden = true;*/
    
}

-(IBAction)clicklarry:(id)sender{
    ButtonwasHitted = true;
    [self roundstop];
/*    if(!ButtonwasHitted){
        //totalhits=totalhits +1 ;
        ButtonwasHitted = true;
        //scorelabel.text = [NSString stringWithFormat:
        //                   @"Score: %d",score];
        //timing=4;
    }
    tempv.hidden=true;   
*/
 }

-(IBAction)clickalant:(id)sender{
    ButtonwasHitted = true;
    [self roundstop]; 
    
/*    if(!ButtonwasHitted){
        wronghits=wronghits +1;
        //rounds++; //compensate the rounds-- in onTime case 4
        ButtonwasHitted = true;
        //scorelabel.text = [NSString stringWithFormat:
        //                   @"Score: %d",score];
        //timing=4;
    }
    tempv.hidden=true; 
*/
 }

//-(IBAction)changediff:(id)sender{
    
//}

-(IBAction)changerounds:(id)sender{
    roundslabel.text = [NSString stringWithFormat:
                        @"%d Rounds",(int)roundslider.value];
    totalrounds = (int)roundslider.value - 1;
    //NSLog(@"round setting @d")
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
    //if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    return ((interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
            ||(interfaceOrientation ==UIDeviceOrientationPortrait));
}

@end
