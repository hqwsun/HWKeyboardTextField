//
//  HWKeyBoardTextView.h
//  KeyboardTextField
//
//  Created by 黄秋伟 on 2017/11/15.
//  Copyright © 2017年 黄秋伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWKeyBoardTextView : UITextView

- (void)adaptView:(UIView *)target;
- (void)adaptView:(UIView *)target beyondY:(CGFloat)beyondY;


@end
