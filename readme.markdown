# HMTimer

HMTimer is an Objective C wrapper that provides a simple, NSTimer-like interface for *dispatch_after()* with a block completion handler.

## Usage

Unscheduled instances of HMTimer must be fired manually:

	HMTimer *timer = [HMTimer timerWithDuration: 2.0
                                       	  queue: dispatch_get_main_queue()
                                        repeats: NO
                           	  completionHandler: ^(void) {
                                  // Do whatever you want upon completion...
                              }];
    
    [timer fire];
    
Scheduled instances of HMTimer are fired automatically upon initialization:

	HMTimer *timer = [HMTimer scheduledTimerWithDuration: 2.0
                                       	 		   queue: dispatch_get_main_queue()
                                				 repeats: NO
                           	  		   completionHandler: ^(void) {
                                  		   // Do whatever you want upon completion...
                              		   }];
                              		   
If the *repeats* parameter is true, the timer will fire repeatedly using the *duration* as the interval between firings:

	HMTimer *timer = [HMTimer scheduledTimerWithDuration: 2.0
                                       	 		   queue: dispatch_get_main_queue()
                                				 repeats: YES
                           	  		   completionHandler: ^(void) {
                                  		   // Do whatever you want upon completion...
                              		   }];
                              		   
You can specify a different dispatch queue to keep HMTimer from running on the main thread:

	dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

	HMTimer *timer = [HMTimer scheduledTimerWithDuration: 2.0
                                       	 		   queue: queue
                                				 repeats: NO
                           	  		   completionHandler: ^(void) {
                                  		   // Do whatever you want upon completion...
                              		   }];
                              
An instance of HMTimer can be invalidated by calling the *- invalidate* method:

	[timer invalidate];
  
### Please Note:

HMTimer assumes the use of automatic reference counting (ARC).                          		   

## License

HMTimer is released under the terms of the [MIT license](http://opensource.org/licenses/mit-license.php "MIT License"):

Copyright (C) 2012 Heuristic Media Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.