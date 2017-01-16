//
//  ViewController.m
//  BCKeyBoardDemo
//
//  Created by baochao on 15/7/29.
//  Copyright (c) 2015年 baochao. All rights reserved.
//

#import "ViewController.h"
#import "BCKeyBoard.h"

@interface ViewController () <BCKeyBoardDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加表情键盘

    BCKeyBoard *bcKeyBoard = [[BCKeyBoard alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 46, SCREEN_WIDTH,46)];
    [self.view addSubview:bcKeyBoard];
    bcKeyBoard.delegate = self;
    bcKeyBoard.currentCtr = self;
    
    bcKeyBoard.placeholder = @"我也来聊几句...";
    bcKeyBoard.placeholderColor = [UIColor colorWithRed:133/255 green:133/255 blue:133/255 alpha:0.5];
    bcKeyBoard.backgroundColor = [UIColor clearColor];
}

#pragma mark - BCKeyBoardDelegate

- (void)didSendText:(NSString *)text
{
    NSLog(@"--- %@",text);
}

- (void)returnHeight:(CGFloat)height
{
    NSLog(@"--- %f",height);
}

- (void)returnImage:(UIImage *)image{
    
    NSLog(@"---------");
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    imageView.image = image;
    [self.view addSubview:imageView];
}

@end
