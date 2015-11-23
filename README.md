# BDTimer
getCode Timer

# Use

create timer object
```oc
- (void)viewDidLoad {
    [super viewDidLoad];
    timerHandler = [BDTimerHandler timerHandler];
    // Do any additional setup after loading the view, typically from a nib.
}
```

```oc
- (IBAction)getCodeClicked:(id)sender {
    if (![timerHandler getCurrentState]) {
        [timerHandler startTimer];
    }
    timerHandler.getTimeInterval = ^(NSString *timeInterval, BOOL state) {
        NSLog(@"____%@____state: [%d]",timeInterval, state);
        [(UIButton *)sender setEnabled:!state];
        [(UIButton *)sender setTitle:timeInterval forState:UIControlStateNormal];
    };
}
```
