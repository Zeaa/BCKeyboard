//
//  BCKeyBoard.h
//  BCDemo
//
//  Created by baochao on 15/7/27.
//  Copyright (c) 2015年 baochao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@protocol BCKeyBoardDelegate <NSObject>

/** 回调返回发送的文字 */
- (void)didSendText:(NSString *)text;

/** 回调返回高度 */
- (void)returnHeight:(CGFloat)height;

/** 回调返回图片 */
- (void)returnImage:(UIImage *)image;

@end

@interface BCKeyBoard : UIView

@property (nonatomic, weak) id<BCKeyBoardDelegate> delegate;
@property (nonatomic, strong) UIViewController *currentCtr;
@property (nonatomic, strong) NSString *placeholder;          // 占位文字
@property (nonatomic, strong) UIColor *placeholderColor;      // 占位文字颜色

@end
