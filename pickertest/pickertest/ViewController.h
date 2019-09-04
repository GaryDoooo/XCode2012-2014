//
//  ViewController.h
//  pickertest
//
//  Created by Herrick Wang on 12-1-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController 
    <UIPickerViewDataSource, UIPickerViewDelegate> {
        IBOutlet UIPickerView *picker;
        IBOutlet UILabel *label;
        IBOutlet UILabel *hint;
        IBOutlet UISegmentedControl *diffpicker;
        IBOutlet UIImageView *view1;
        IBOutlet UIImageView *view2;
        //IBOutlet UILabel *goodwork;
        NSArray *content;
        NSMutableArray *correct;
        NSMutableArray *answer;
        NSMutableArray *blockers;
        NSArray *pictures, *words;
        //int blockindex[4];
        NSTimer *timer;
        int difficulty,currentwordindex;
        UIImageView *tempImageView, *bgImageView;
        
}

@property (nonatomic,retain) UIPickerView *picker;

-(IBAction)changediff:(id)sender;
-(void)startrun;

@end
