//
//  TextFieldTableViewCell.h
//  KeyboardTextField
//
//  Created by 黄秋伟 on 2017/11/15.
//  Copyright © 2017年 黄秋伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HWKeyBoardTextField.h"

@interface TextFieldTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet HWKeyBoardTextField *textField;

@end
