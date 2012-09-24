//
//  HMViewController.h
//  HMTimer
//
//  Created by Tony Wallace on 2012-09-23.
//  Copyright (c) 2012 Heuristic Media Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMTimer.h"

@interface HMViewController : UIViewController {
    
    HMTimer *timer1;
    HMTimer *timer2;
    
}

@property (nonatomic, retain) HMTimer *timer1;
@property (nonatomic, retain) HMTimer *timer2;

@end
