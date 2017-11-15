//
//  UITextView+Placeholder.m
//  runtime
//
//  Created by 黄秋伟 on 2017/8/23.
//  Copyright © 2017年 黄秋伟. All rights reserved.
//

#import "UITextView+Placeholder.h"
#import <objc/runtime.h>
#import <objc/message.h>

#define SYSTEM_VERSION_LATER(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_SAME(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

static char cus_placeHolderLabelKey;

@implementation UITextView (Placeholder)


- (void)hdf_placehoderTextChange:(NSNotification *)notification {
    if (SYSTEM_VERSION_LATER(@"7")) {
        if (!self.text) {
            self.placeholderLabel.text = @"";
        } else {
            self.placeholderLabel.text = self.placeholder;
        }
    }
}

// 动态创建set/get 方法

- (UILabel *)placeholderLabel {
    UILabel *label = objc_getAssociatedObject(self, &cus_placeHolderLabelKey);
    
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([UITextView class], &count);
    BOOL placeholderEnable = NO;
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *objcName = [NSString stringWithUTF8String:name];
        NSLog(@"%d : %@",i,objcName);
        if ([objcName isEqualToString:@"_placeholderLabel"]) {
            placeholderEnable = YES;
        }
    }
    
    if (label == nil || ![label isKindOfClass:[UILabel class]]) {
        label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = self.font;
        [label sizeToFit];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor colorWithRed:187/255.0 green:187/255.0 blue:187/255.0 alpha:1];
        self.placeholderLabel = label;
        [self addSubview:label];
        if (placeholderEnable) {
            [self setValue:label forKey:@"_placeholderLabel"];
        }

    }
    return label;
}

- (void)setPlaceholderLabel:(UILabel *)placeholderLabel {
    return objc_setAssociatedObject(self, &cus_placeHolderLabelKey, placeholderLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)placeholderColor {
    return  self.placeholderLabel.textColor;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    self.placeholderLabel.textColor = placeholderColor;
}

- (UIFont *)placeholderFont {
    return self.placeholderLabel.font;
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont {
    self.placeholderLabel.font = placeholderFont;
}

- (NSString *)placeholder {
    return self.placeholderLabel.text;
}

- (void)setPlaceholder:(NSString *)placeholder {
    self.placeholderLabel.text = placeholder;
}

@end
