//
//  ViewController.h
//  viewstudy
//
//  Created by Herrick Wang on 12-1-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UIImageView *imageview1;
    IBOutlet UIImageView *imageview2;
    IBOutlet UIPageControl *pagecontrol;
    UIImageView *tempimage, *bgimage;
}

@property (nonatomic, retain) UIPageControl *pagecontrol;
@property (nonatomic, retain) UIImageView *imageview1;
@property (nonatomic, retain) UIImageView *imageview2;

@end
