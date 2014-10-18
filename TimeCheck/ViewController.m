//
//  ViewController.m
//  TimeCheck
//
//  Created by tonosama on 2014/10/12.
//  Copyright (c) 2014年 tono. All rights reserved.
//
//- 範囲指定は、開始時刻を含み、終了時刻は含まないと判断すること。
//- ただし開始時刻と終了時刻が同じ場合は含むと判断すること。
//- 開始時刻が22時で終了時刻が5時、というような指定をされても動作すること。
//- 可読性、保守性、拡張性を考慮すること。

#import "ViewController.h"

@interface ViewController (){
    NSInteger _startTime;
    NSInteger _endTime;
    NSInteger _designationTime;
}

@property (nonatomic) IBOutlet UITextField *startTimeText; // 開始時刻
@property (nonatomic) IBOutlet UITextField *endTimeText; // 終了時刻
@property (nonatomic) IBOutlet UITextField *designationTimeText; // 指定時刻
@property (nonatomic) IBOutlet UIButton *timeCheckBtn; // 判定ボタン

- (IBAction)TimeCheckAct:(id)sender;
- (Boolean)isCheck;
- (Boolean)isTime;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



// 判定ボタンのアクション
- (IBAction)TimeCheckAct:(id)sender {

    if([self isTime] == YES ){
        [self isCheck];
        
    }
}

// 範囲確認
- (Boolean)isCheck{

    UIAlertController *alertError = [UIAlertController alertControllerWithTitle:@"範囲判定" message:@"範囲外です" preferredStyle:UIAlertControllerStyleAlert];
    _startTime = _startTimeText.text.integerValue;
    _endTime = _endTimeText.text.integerValue;
    _designationTime = _designationTimeText.text.integerValue;
    
    // ex. 開始時刻：23時 終了時刻：1時 指定時刻：24時
    if (_startTime > _endTime) {
        if (_endTime <= _designationTime  &&
            _designationTime < _startTime) {

            [alertError addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alertError animated:YES completion:nil];
            
            return NO;
        }
    }else if(_startTime < _endTime){
        if (_endTime <= _designationTime  || _designationTime <_startTime) {

            [alertError addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alertError animated:YES completion:nil];

            return NO;
        }
    }else if (_startTime == _endTime){
        if (_startTime != _designationTime) {
            
            [alertError addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alertError animated:YES completion:nil];
            return NO;
        }
    }
    
    UIAlertController *alertSucces = [UIAlertController alertControllerWithTitle:@"範囲判定" message:@"範囲内です" preferredStyle:UIAlertControllerStyleAlert];

    
    [alertSucces addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:alertSucces animated:YES completion:nil];

    return YES;
}

// 時刻確認
- (Boolean)isTime {
    
    _startTime = _startTimeText.text.integerValue;
    _endTime = _endTimeText.text.integerValue;
    _designationTime = _designationTimeText.text.integerValue;

    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"時刻を入力してください。\n１時から24時までです。" message:nil preferredStyle:UIAlertControllerStyleAlert];

    if ( _startTime < 1  || _startTime > 24) {
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        
        return NO;
    }
    if ( _endTime < 1  || _endTime > 24) {
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        
        return NO;
    }
    
    if ( _designationTime < 1  || _designationTime > 24) {
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];

        return NO;
    }

    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
