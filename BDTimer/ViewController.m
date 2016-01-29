//
//  ViewController.m
//  BDTimer
//
//  Created by 冰点 on 15/11/23.
//  Copyright © 2015年 冰点. All rights reserved.
//

#import "ViewController.h"
#import "BDTimerHandler.h"

@interface ViewController ()
{
    BDTimerHandler *timerHandler;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    timerHandler = [BDTimerHandler timerHandler];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [timerHandler cancelTimer];
}

- (IBAction)getCodeClicked:(UIButton *)sender {
    if (![timerHandler getCurrentState]) {
        [timerHandler startTimer];
    }
    timerHandler.getTimeInterval = ^(NSString *timeInterval, BOOL state) {
        NSLog(@"____%@____state: [%d]",timeInterval, state);
        [sender setEnabled:!state];
        //解决闪烁问题：
        sender.titleLabel.text = timeInterval;
        
        [sender setTitle:timeInterval forState:UIControlStateNormal];
    };
}


@end
