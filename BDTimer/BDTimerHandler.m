//
//  BDTimerHandler.m
//  BDTimer
//
//  Created by 冰点 on 15/11/23.
//  Copyright © 2015年 冰点. All rights reserved.
//

#import "BDTimerHandler.h"

@implementation BDTimerHandler

@synthesize timer = timer_, currentState = currentState_;

+ (BDTimerHandler *)timerHandler
{
    static dispatch_once_t onceToken;
    static BDTimerHandler *timerHandler = nil;
    dispatch_once(&onceToken, ^{
        timerHandler = [[BDTimerHandler alloc] init];
    });
    return timerHandler;
}

- (void)startTimer
{
    __block int timeout=59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    timer_ = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(timer_,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(timer_, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(timer_);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                currentState_ = NO;
                if (_getTimeInterval) {
                    _getTimeInterval(@"getCode", currentState_);
                }
            });
        }else{
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%dS", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                currentState_ = YES;
                if (_getTimeInterval) {
                    _getTimeInterval(strTime, currentState_);
                }
            });
            timeout--;
        }
    });
    //启动
    dispatch_resume(timer_);
}

- (void)cancelTimer
{
    if (timer_) {
        currentState_ = NO;
        dispatch_source_cancel(timer_);
    }
}

- (BOOL)getCurrentState
{
    return currentState_;
}

@end
