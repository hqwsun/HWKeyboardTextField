//
//  UITextView+Placeholder.h
//  runtime
//
//  Created by 黄秋伟 on 2017/8/23.
//  Copyright © 2017年 黄秋伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Placeholder)

@property (copy, nonatomic)NSString *placeholder;

@property (strong, nonatomic)UIColor *placeholderColor;

@property (strong, nonatomic)UIFont *placeholderFont;
/**
 * 占位提示语标签
 */
@property (nonatomic, strong) UILabel *placeholderLabel;


@end
