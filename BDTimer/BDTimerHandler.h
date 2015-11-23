//
//  BDTimerHandler.h
//  BDTimer
//
//  Created by 冰点 on 15/11/23.
//  Copyright © 2015年 冰点. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDTimerHandler : NSObject
{
    @private
    dispatch_source_t timer_;
    BOOL currentState_;
}

@property (nonatomic) dispatch_source_t timer;
@property (nonatomic, assign) BOOL currentState;

+ (BDTimerHandler *)timerHandler;

- (void)startTimer;
- (void)cancelTimer;

- (BOOL)getCurrentState;

@property (nonatomic, copy) void(^getTimeInterval)(NSString *timeInterval, BOOL state);

@end
