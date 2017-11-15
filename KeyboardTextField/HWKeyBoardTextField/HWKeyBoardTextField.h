//
//  HWKeyBoardTextField.h
//  KeyboardTextField
//
//  Created by 黄秋伟 on 2017/11/15.
//  Copyright © 2017年 黄秋伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextView+Placeholder.h"

@interface HWKeyBoardTextField : UITextField

- (void)adaptView:(UIView *)target;
- (void)adaptView:(UIView *)target beyondY:(CGFloat)beyondY;

@end
