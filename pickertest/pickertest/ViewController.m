//
//  ViewController.m
//  pickertest
//
//  Created by Herrick Wang on 12-1-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize picker;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(NSMutableArray*) stringtoarry:(NSString *)inputstring{
    int i,l;
    NSRange substringrange;
    NSMutableArray *targetArray;
    
    substringrange.length =1;
    l=[inputstring length];
    targetArray =[[NSMutableArray alloc] init];
    for (i=0;i<l;i++){
        substringrange.location=i;
        [targetArray addObject:[inputstring substringWithRange:substringrange]];
    }
    return targetArray;
}

//- (void)onTimer{
- (BOOL) checkanswer{
    UIView *tempv;
    int number_of_correct=0;
    
    //NSLog(@"correct#:%d,answer#:%d,blockers#:%d,content#:%d",[correct count],[answer count],[blockers count],[content count]);
    for (int i=0;i<4;i++){
        tempv = [blockers objectAtIndex:i];
        if([content indexOfObject:[correct objectAtIndex:i]]
           ==[content indexOfObject:[answer objectAtIndex:i]]){
            tempv.hidden = false;
            number_of_correct ++;
        } else {
            tempv.hidden = true;
        }
        //if(!tempv.hidden) number_of_correct ++;
        NSLog(@"index:%d, correct=%@, answer=%@, rightanswers#=%d",i,[correct objectAtIndex:i],[answer objectAtIndex:i],number_of_correct);
    }
    
    if(number_of_correct==4) {
        return true;
    } else {
        return false;
    }
     //[self startrun];
}

-(void)startrun{
    int wordindex,hidecharofindex;
    BOOL wordhide[4]={false,false,false,false};
    NSMutableArray *tempword;
    NSString *tempchar;
    
    do {
        wordindex = rand() % [words count];
    } while (wordindex == currentwordindex);
    
    //stringtoarry(&tempword, [words objectAtIndex:wordindex]);
    //correct=[tempword copy];
    //answer=[tempword copy];
    tempword = [self stringtoarry:[words objectAtIndex:wordindex]];
    answer=[[NSMutableArray alloc] initWithArray:tempword copyItems:YES];
    correct=[[NSMutableArray alloc] initWithArray:tempword copyItems:YES];
    currentwordindex = wordindex;
    
    /* ..... Debug coding ....... */
    for (int i=0;i<4;i++){
        NSLog(@"correct[%d]=%@, answer[%d]=%@, temp[%d]=%@"
              ,i,[correct objectAtIndex:i]
              ,i,[answer objectAtIndex:i]
              ,i,[tempword objectAtIndex:i]);
    }
    /* ..... Debug coding ....... */
   
    for(int i=0;i<difficulty;i++){  //rand get the char need to hide in answer
        do {
            hidecharofindex = rand() % 4;
        } while (wordhide[hidecharofindex]);
        wordhide[hidecharofindex]=true;
    }
    
        /* ..... Debug coding ....... */
    for (int i=0;i<4;i++){
        if(wordhide[i]){
            NSLog(@"charhide[%d]=true",i);
        } else{
            NSLog(@"charhide[%d]=false",i);
        }
        
    }
        /* ..... Debug coding ....... */
    
    for(int i=0;i<4;i++){ //change the aswer in the wheel and label by hiding
        
        int numberofchar = [content indexOfObject:[correct objectAtIndex:i]];
        if(wordhide[i]) {
            numberofchar=(numberofchar +(rand()%20)+4)%26;
            //[answer replaceObjectAtIndex:i withObject:(NSString*)[content objectAtIndex:numberofchar]];
            tempchar = [[content objectAtIndex:numberofchar] copy];
            NSLog(@"tempchar=%@",tempchar);
            [answer replaceObjectAtIndex:i withObject:tempchar];
            [tempword replaceObjectAtIndex:i withObject:@"?"];  //tempword to hint
        }
        [picker selectRow:numberofchar inComponent:i animated:YES];
    }
    
    label.text =[NSString stringWithFormat:@"%@%@%@%@",
                 [answer objectAtIndex:0],[answer objectAtIndex:1],
                 [answer objectAtIndex:2],[answer objectAtIndex:3]];
    
    hint.text =[NSString stringWithFormat:@"%@%@%@%@",
                 [tempword objectAtIndex:0],[tempword objectAtIndex:1],
                 [tempword objectAtIndex:2],[tempword objectAtIndex:3]];
    [self checkanswer];
    
    [tempImageView setImage:[UIImage imageNamed:
                             [pictures objectAtIndex:wordindex]]];
    
    //---switch the two imageview views---
    if (tempImageView.tag==81) { //---imageView1---
        tempImageView = view2;
        bgImageView = view1; }
    else { //---imageView2--- 
        tempImageView = view1; 
        bgImageView = view2;
    }
    
    //---animate the two views flipping---
    [UIView beginAnimations:@"flipping view" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromLeft
                           forView:tempImageView cache:YES]; 
    [tempImageView setHidden:YES]; 
    [UIView commitAnimations];
    
    [UIView beginAnimations:@"flipping view" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromRight
                           forView:bgImageView cache:YES]; 
    [bgImageView setHidden:NO];
    [UIView commitAnimations];
    
    //goodwork.hidden = true;
}

-(void)stoprun{
    
}

-(void)datasetting{
    words = [[NSArray alloc] initWithObjects:
             @"WOLF",
             @"LAMB",
             @"BABY",
             @"BIKE",
             @"BIRD",
             @"DISK",
             @"FISH",
             @"FOOT",
             @"HAND",
             @"KITE",
             @"RICE",
             @"SAND",
                nil];
    pictures= [[NSArray alloc] initWithObjects:
               @"s_huitailang.png",
               @"s_lanyangyang.png",
               @"s_baby.png",
               @"s_bike.png",
               @"s_bird.png",
               @"s_disk.png",
               @"s_fish.jpg",
               @"s_foot.png",
               @"s_hand.jpg",
               @"s_kite.png",
               @"s_rice.png",
               @"s_sand.png",
               nil];
}

- (void)viewDidLoad
{
    UIView *tempv;
    
    content = [[NSArray alloc] initWithObjects:@"A",@"B",@"C",@"D"
               ,@"E",@"F",@"G",@"H"
               ,@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",
               @"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",nil];
    label.text = @"AAAA";
    hint.text =@"L__P";
    answer = [[NSMutableArray alloc] initWithObjects:@"A",@"A",@"A",@"A", nil];
    correct = [[NSMutableArray alloc] initWithObjects:@"L",@"A",@"M",@"P", nil];
    
    blockers = [[NSMutableArray alloc] init];
    for(int i=0;i<[self.view.subviews count];i++){
        tempv=[self.view.subviews objectAtIndex:i];
        if((tempv.tag > 90)&&(tempv.tag <95)) {
            tempv.hidden = true;
            [blockers addObject:tempv];
            NSLog(@"found view.subview index:%d",i);
            //blockindex[tempv.tag-90]=i;
        }
    }
    
    difficulty =1;
    currentwordindex = -1;
    tempImageView = view1;
    //goodwork.hidden=true;
    srand(time(0)); //seed the random;
    [self datasetting];
    
    [self startrun]; //launch;
    //[self checkanswer];
    
    /*timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                             target:self
                                           selector:@selector(onTimer)
                                           userInfo:nil
                                            repeats:YES];
    */
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)changediff:(id)sender{
    difficulty = diffpicker.selectedSegmentIndex+1;
    [self startrun];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


// 返回显示的列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
    return 4;
}
// 返回当前列显示的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [content count];
}
// 设置当前行的内容，若果行没有显示则自动释放
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [content objectAtIndex:row];
}
//---the item selected by the user---
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //NSString *result = [pickerView pickerView:pickerView titleForRow:row forComponent:component];
    NSString  *result = nil;
    //for(int i=0;i<picker.numberOfComponents;i++){
    result = [content objectAtIndex:row];
    NSLog(@"change component %d",component);
    [answer replaceObjectAtIndex:component withObject:result];
    label.text =[NSString stringWithFormat:@"%@%@%@%@",
                 [answer objectAtIndex:0],[answer objectAtIndex:1],
                 [answer objectAtIndex:2],[answer objectAtIndex:3]];
    
    if([self checkanswer]){
        //goodwork.hidden = false;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"GOOD WORK!" 
                    message: @"Try Again?" delegate:self 
                    cancelButtonTitle:@"OK" otherButtonTitles:nil, nil]; 
    [alert show];
    [self startrun];
        //goodwork.hidden = true;
    }
    
             /*[label.text substringToIndex:component],
             result,
             [label.text substringFromIndex:component+1]];*/
    //NSLog(@"result: %@",result);
    //}
    //label.text = result;
 //contentview.text = result;
 //   [result release];
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
    //} else {
    //    return YES;
    //}
}

@end
