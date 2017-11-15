//
//  ViewController.m
//  KeyboardTextField
//
//  Created by 黄秋伟 on 2017/11/15.
//  Copyright © 2017年 黄秋伟. All rights reserved.
//

#import "ViewController.h"
#import "HWKeyBoardTextField.h"
#import "HWKeyBoardTextView.h"
#import "TableKeyboardViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet HWKeyBoardTextField *textField1;
@property (weak, nonatomic) IBOutlet HWKeyBoardTextView *textView1;

@property (weak, nonatomic) IBOutlet HWKeyBoardTextField *textField2;
@property (weak, nonatomic) IBOutlet HWKeyBoardTextView *textView2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [_textField1 adaptView:self.view];
    [_textField2 adaptView:self.view];
    [_textView1 adaptView:self.view];
    [_textView2 adaptView:self.view];
    
    // textView 可增加place
    _textView1.placeholder = @"请在文本框输入内容";
    _textView2.placeholder = @"请在文本框输入内容";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handlePushTableView:(UIButton *)sender {
    [self.navigationController pushViewController:[TableKeyboardViewController new] animated:YES];
}

@end
