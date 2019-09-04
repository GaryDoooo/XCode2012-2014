//
//  ViewController.m
//  iPAD_C51_comm
//
//  Created by GDu on 13-3-10.
//  Copyright (c) 2013年 GDu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)set_white_box{
    white_block.hidden = !white_block.isHidden;
    white_box_timer++;
    if (white_box_timer == repeat_time) //stop timer.....
        [timer invalidate];
}

-(IBAction) ipadinput_at_segment:(id)sender{
    
    repeat_time = (segmentinput.selectedSegmentIndex +1) * 2;
    white_box_timer = 0;
    // timer set with second
    timer = [NSTimer scheduledTimerWithTimeInterval:.1
                                             target:self
                                           selector:@selector(set_white_box)
                                           userInfo:nil repeats:YES];
}

-(void)checkinput{
    long timegap;   //long sec_gap;
    /*
    gettimeofday(&time2,NULL);
    //time_gap_s = time1.tv_sec - time2.tv_sec;
    sec_gap = (time2.tv_sec - time_last_buttom.tv_sec)%10000;
    timegap =  (double)sec_gap +
    ((double)time2.tv_usec - (double)time_last_buttom.tv_usec)/1e-6;
*/
    time2=time(0);
    timegap = time2 - time_last_buttom;

    if (timegap >1) textbox.text = [NSString stringWithFormat:@"got input: %d",
                                    button_input];
    label1.text = [NSString stringWithFormat:@"global: %ld sec",timegap];

}

-(IBAction)touchinput:(id)sender{
    long timegap;
    //long sec_gap;
    
    //gettimeofday(&time2,NULL);
    //time_gap_s = time1.tv_sec - time2.tv_sec;
    //sec_gap = (time2.tv_sec - time_last_buttom.tv_sec)%10000;
    //timegap =  (double)sec_gap +
    //        ((double)time2.tv_usec - (double)time_last_buttom.tv_usec)/1e-6;
    time2=time(0);
    timegap = time2 - time_last_buttom;
    if ( timegap <= 1) button_input++;
    if (timegap >1) button_input =1;
    time_last_buttom = time2;
    
    label2.text = [NSString stringWithFormat:@"buttom: %ld sec",timegap];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[UIScreen mainScreen] setBrightness:1];
    white_block.hidden = TRUE;
    //gettimeofday(&systime,NULL);
    //gettimeofday(&time_last_buttom,NULL);//get time for button counting,
    time_last_buttom = time(0);
    textbox.text = [NSString stringWithFormat:@"time: %lds", time_last_buttom];
                    //systime.tv_sec,systime.tv_usec];
    button_input=0;
    
    timer_global = [NSTimer scheduledTimerWithTimeInterval:0.2
                                             target:self
                                           selector:@selector(checkinput)
                                           userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
