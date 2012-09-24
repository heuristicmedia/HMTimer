/*
 
Copyright (C) <2012> <Heuristic Media Inc.>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
*/

#import <Foundation/Foundation.h>

@interface HMTimer : NSObject {
    
    int64_t _duration;
    dispatch_queue_t _queue;
    BOOL _repeats;
    BOOL _isValid;
    
    void (^_handler)(void);
    
}

@property (nonatomic, readonly) int64_t duration;
@property (nonatomic, readonly) dispatch_queue_t queue;
@property (nonatomic, readonly) BOOL repeats;
@property (nonatomic, readonly) BOOL isValid;

@property (nonatomic, readonly) void (^handler)(void);

+ (HMTimer *) timerWithDuration:(int64_t)duration
                          queue:(dispatch_queue_t)queue
                        repeats:(BOOL)repeats
              completionHandler:(void(^)(void))handler;

+ (HMTimer *) scheduledTimerWithDuration:(int64_t)duration
                                   queue:(dispatch_queue_t)queue
                                 repeats:(BOOL)repeats
                       completionHandler:(void(^)(void))handler;

- (id) initWithDuration:(int64_t)duration
                  queue:(dispatch_queue_t)queue
                repeats:(BOOL)repeats
      completionHandler:(void(^)(void))handler;

- (void) fire;
- (void) invalidate;

@end
