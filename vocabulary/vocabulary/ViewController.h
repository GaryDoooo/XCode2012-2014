//
//  ViewController.h
//  vocabulary
//
//  Created by Herrick Wang on 12-1-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UIPickerView *color;
}

@end

@protocol FlipsideViewControllerDelegate;
@interface FlipsideViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate> {
    id <FlipsideViewControllerDelegate> delegate;
    IBOutlet UITextField *loginName; IBOutlet UITextField *password; IBOutlet UIPickerView *favoriteColor;
}
@property (nonatomic, retain) UITextField *loginName; @property (nonatomic, retain) UITextField *password; @property (nonatomic, retain) UIPickerView *favoriteColor;
@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate; - (IBAction)done;
@end
@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller; @end