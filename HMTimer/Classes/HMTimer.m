/*
 
Copyright (C) <2012> <Heuristic Media Inc.>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

#import "HMTimer.h"

@implementation HMTimer

@synthesize duration=_duration;
@synthesize queue=_queue;
@synthesize repeats=_repeats;
@synthesize isValid=_isValid;
@synthesize handler=_handler;

+ (HMTimer *) timerWithDuration:(NSTimeInterval)duration
                          queue:(dispatch_queue_t)queue
                        repeats:(BOOL)repeats
              completionHandler:(void(^)(void))handler {
    
    HMTimer *timer = [[HMTimer alloc] initWithDuration: duration
                                                 queue: queue
                                               repeats: repeats
                                     completionHandler: handler];
    
    return timer;
    
}

+ (HMTimer *) scheduledTimerWithDuration:(NSTimeInterval)duration
                                   queue:(dispatch_queue_t)queue
                                 repeats:(BOOL)repeats
                       completionHandler:(void(^)(void))handler {
    
    HMTimer *timer = [[HMTimer alloc] initWithDuration: duration
                                                 queue: queue
                                               repeats: repeats
                                     completionHandler: handler];
    
    [timer fire];
    
    return timer;
    
}

- (id) initWithDuration:(NSTimeInterval)duration
                         queue:(dispatch_queue_t)queue
                       repeats:(BOOL)repeats
             completionHandler:(void(^)(void))handler {
    
    self = [super init];
    
    if (self) {
        _duration = duration;
        _queue = queue;
        _repeats = repeats;
        _isValid = YES;
        _handler = handler;
    }
    
    return self;
    
}

- (void) fire {
    
    int64_t nanoseconds = self.duration * NSEC_PER_SEC;
    
    dispatch_time_t fireTime = dispatch_time(DISPATCH_TIME_NOW, nanoseconds);
    dispatch_after(fireTime, self.queue, ^(void){
        
        if (!self.isValid) {
            return;
        }
        
        self.handler();
        
        if (self.repeats) {
            [self fire];
        } else {
            [self invalidate];
        }
        
    });
    
}

- (void) invalidate {
    _isValid = NO;
}

@end
