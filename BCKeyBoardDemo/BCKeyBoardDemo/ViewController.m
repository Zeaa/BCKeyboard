//
//  ViewController.m
//  BCKeyBoardDemo
//
//  Created by baochao on 15/7/29.
//  Copyright (c) 2015年 baochao. All rights reserved.
//

#import "ViewController.h"
#import "BCKeyBoard.h"
#import "Emoji.h"

@interface ViewController () <BCKeyBoardDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BCKeyBoard *bc = [[BCKeyBoard alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 46, [UIScreen mainScreen].bounds.size.width,46)];
    [self.view addSubview:bc];
    bc.delegate = self;
    bc.placeholder = @"我来说几句";
    bc.currentCtr = self;
    bc.placeholderColor = [UIColor colorWithRed:133/255 green:133/255 blue:133/255 alpha:0.5];
    bc.backgroundColor = [UIColor clearColor];
    
    Emoji *emoji = [Emoji new];
    [emoji allImageEmoji];
}

#pragma mark - 回调代理方法

- (void)didSendText:(NSString *)text
{
    NSLog(@"%@",text);
}

- (void)returnHeight:(CGFloat)height
{
    NSLog(@"%f",height);
}

- (void)returnImage:(UIImage *)image{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    imageView.image = image;
    [self.view addSubview:imageView];
}

@end
