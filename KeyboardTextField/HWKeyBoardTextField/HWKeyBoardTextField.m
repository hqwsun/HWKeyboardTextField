//
//  HWKeyBoardTextField.m
//  KeyboardTextField
//
//  Created by 黄秋伟 on 2017/11/15.
//  Copyright © 2017年 黄秋伟. All rights reserved.
//

#import "HWKeyBoardTextField.h"

@interface HWKeyBoardTextField ()<UIGestureRecognizerDelegate>
{
    CGFloat keyboardTextOrginY;
    CGFloat beyondFrameY;
    CGRect targetViewFrame;
}

@property (strong, nonatomic) UITapGestureRecognizer *TextFieldRecognizer;
@property (weak, nonatomic) UIView * target;

@end

@implementation HWKeyBoardTextField

- (instancetype)init {
    
    if (self = [super init]) {
        [self initView];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        [self initView];
    }
    return self;
}

- (void)initView {
    keyboardTextOrginY = 0.0;
    beyondFrameY = 0.0;
    // 键盘操作
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardFrame:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardFrame:) name:UIKeyboardWillHideNotification object:nil];
    
    
    [self addTarget:self action:@selector(addGestureRecognizer) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(hiddenKeyboard) forControlEvents:UIControlEventEditingDidEnd];
}

- (void)addGestureRecognizer {
    _TextFieldRecognizer = [[UITapGestureRecognizer alloc]
                            initWithTarget:self action:@selector(hiddenKeyboard)];
    _TextFieldRecognizer.delegate = self;
    [[[UIApplication sharedApplication] keyWindow] addGestureRecognizer:_TextFieldRecognizer];
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    
    if ([touch.view isKindOfClass:[UITextView class]]){
        return  NO;
    }
    if ([touch.view isKindOfClass:[UIButton class]]) {
        [self hiddenKeyboard];
        return  NO;
    }
    return YES;
}

#pragma mark - 外部方法

- (void)adaptView:(UIView *)target {
    if (target != nil) {
        _target = target;
        targetViewFrame = _target.frame;
    }
}

- (void)adaptView:(UIView *)target beyondY:(CGFloat)beyondY {
    if (target != nil) {
        _target = target;
        targetViewFrame = _target.frame;
    }
    beyondFrameY = beyondY;
}

#pragma mark - 监控键盘

// 隐藏键盘
- (void)hiddenKeyboard
{
    [[[UIApplication sharedApplication] keyWindow]  removeGestureRecognizer:_TextFieldRecognizer];
    _TextFieldRecognizer.delegate = nil;
    _TextFieldRecognizer = nil;
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    
}

- (void)handleKeyboardFrame:(NSNotification *)aNotification {
    
    if (self.target == nil) {
        return;
    }
    
    // 获取当前第一焦点对象控件
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIView *firstView = [keyWindow performSelector:@selector(firstResponder)];
    
    if (![firstView isKindOfClass:[UITextField class]] ||
        ![firstView isEqual:self]) {
        return;
    }
    
    // 获取键盘动画时间
    CGFloat duration = [[[aNotification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    // 获取键盘高度
    CGFloat keyHeight = [[[aNotification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue].size.height;
    
    // 获取该控件在屏幕位置
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect currentRect = [firstView convertRect: firstView.bounds toView:window];
    if (keyboardTextOrginY < currentRect.origin.y) {
        keyboardTextOrginY = currentRect.origin.y;
    }
    CGFloat originY = keyboardTextOrginY + currentRect.size.height;
    if ([aNotification.name isEqualToString:@"UIKeyboardWillShowNotification"]) {
        
        if (([UIScreen mainScreen].bounds.size.height - originY) <= keyHeight) {
            
            CGFloat changeY = keyHeight - ([UIScreen mainScreen].bounds.size.height - originY);
            changeY += beyondFrameY;
            __weak typeof(self) weakSelf = self;
            [UIView animateWithDuration:duration animations:^{
                __strong typeof(weakSelf) strongSelf = self;
                CGRect frame = targetViewFrame;
                frame.origin.y -= changeY;
                strongSelf.target.frame = frame;
            }];
        }
    }
    
    if ([aNotification.name isEqualToString:@"UIKeyboardWillHideNotification"]) {
        
        keyboardTextOrginY = 0;
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:duration animations:^{
            __strong typeof(weakSelf) strongSelf = self;
            strongSelf.target.frame = targetViewFrame;
        }];
    }
    
}

- (void)dealloc {
    [self hiddenKeyboard];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
