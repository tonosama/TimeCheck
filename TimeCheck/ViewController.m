//
//  ViewController.m
//  TimeCheck
//
//  Created by 寺本生 on 2014/10/12.
//  Copyright (c) 2014年 tono. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
// 開始時刻
@property (strong, nonatomic) IBOutlet UITextField *StartTimeText;
// 終了時刻
@property (strong, nonatomic) IBOutlet UITextField *EndTimeText;
// 指定時刻
@property (strong, nonatomic) IBOutlet UITextField *DesignationTimeText;

// 判定ボタン
@property (strong, nonatomic) IBOutlet UIButton *TimeCheckBtn;

- (IBAction)TimeCheckAct:(id)sender;
- (Boolean)isCheck;
- (Boolean)isTime;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//- 範囲指定は、開始時刻を含み、終了時刻は含まないと判断すること。
//- ただし開始時刻と終了時刻が同じ場合は含むと判断すること。
//- 開始時刻が22時で終了時刻が5時、というような指定をされても動作すること。
//- 可読性、保守性、拡張性を考慮すること。



- (IBAction)TimeCheckAct:(id)sender {
    
    if([self isTime] == YES ){
        [self isCheck];
        
    }
}

// 範囲確認
- (Boolean)isCheck{
    // ex. 開始時刻：23時 終了時刻：1時
    if (_StartTimeText.text.integerValue > _EndTimeText.text.integerValue) {
        if (_StartTimeText.text.integerValue >= _DesignationTimeText.text.integerValue  ||
            _DesignationTimeText.text.integerValue > _EndTimeText.text.integerValue) {
            NSLog(@"NO");

            return NO;
        }
    }else{
        if (_EndTimeText.text.integerValue >= _DesignationTimeText.text.integerValue  ||
            _DesignationTimeText.text.integerValue > _StartTimeText.text.integerValue) {
            NSLog(@"NO");

            return NO;
        }
    }
    
    NSLog(@"YES");

    return YES;
}

// 時刻確認
- (Boolean)isTime {
    
    if ( _StartTimeText.text.integerValue < 1  || _StartTimeText.text.integerValue > 24) {
        return NO;
    }
    if ( _EndTimeText.text.integerValue < 1  || _EndTimeText.text.integerValue > 24) {
        return NO;
    }
    
    if ( _DesignationTimeText.text.integerValue < 1  || _DesignationTimeText.text.integerValue > 24) {
        return NO;
    }

    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
