//
//  HMViewController.m
//  HMTimer
//
//  Created by Tony Wallace on 2012-09-23.
//  Copyright (c) 2012 Heuristic Media Inc. All rights reserved.
//

#import "HMViewController.h"

@interface HMViewController ()

@end

@implementation HMViewController

@synthesize timer1;
@synthesize timer2;

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear: animated];
    
    // Example - Fire Timer 1 repeatedly until it is invalidated by Timer 2.
    
    NSLog(@"Starting Timer 1: %@", [NSDate date]);
    
    // Unscheduled timer:
    
    self.timer1 = [HMTimer timerWithDuration: 2.0
                                       queue: dispatch_get_main_queue()
                                     repeats: YES
                           completionHandler: ^(void) {
                               NSLog(@"Fired Timer 1: %@", [NSDate date]);
                           }];
    
    [self.timer1 fire];
    
    // Scheduled timer:
    
    self.timer2 = [HMTimer scheduledTimerWithDuration: 10.1
                                                queue: dispatch_get_main_queue()
                                              repeats: NO
                                    completionHandler:  ^(void) {
                                        [self.timer1 invalidate];
                                        NSLog(@"Fired Timer 2, invalidating Timer 1: %@", [NSDate date]);
                                    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
