//
//  TableKeyboardViewController.m
//  KeyboardTextField
//
//  Created by 黄秋伟 on 2017/11/15.
//  Copyright © 2017年 黄秋伟. All rights reserved.
//

#import "TableKeyboardViewController.h"
#import "TextViewTableViewCell.h"
#import "TextFieldTableViewCell.h"

@interface TableKeyboardViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TableKeyboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row%2 == 0) {
        static  NSString  *CellIdentiferId = @"TextViewTableViewCellIdentifier";
        TextViewTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentiferId];
        if (cell == nil) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"TextViewTableViewCell" owner:nil options:nil].lastObject;
            cell.backgroundColor = [UIColor clearColor];
        };
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell.textView adaptView:tableView];
        cell.textView.placeholder = @"请输入文本信息";
        
        return cell;
    } else {
        static  NSString  *CellIdentiferId = @"TextFieldTableViewCellIdentifier";
        TextFieldTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentiferId];
        if (cell == nil) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"TextFieldTableViewCell" owner:nil options:nil].lastObject;
            cell.backgroundColor = [UIColor clearColor];
        };
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell.textField adaptView:tableView];
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row%2 == 0) {
        return 180;
    } else {
        return 100;
    }
}

@end
