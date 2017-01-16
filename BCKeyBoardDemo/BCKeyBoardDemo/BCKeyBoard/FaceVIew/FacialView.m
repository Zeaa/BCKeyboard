/************************************************************
  *  * EaseMob CONFIDENTIAL 
  * __________________ 
  * Copyright (C) 2013-2014 EaseMob Technologies. All rights reserved. 
  *  
  * NOTICE: All information contained herein is, and remains 
  * the property of EaseMob Technologies.
  * Dissemination of this information or reproduction of this material 
  * is strictly forbidden unless prior written permission is obtained
  * from EaseMob Technologies.
  */

#import "FacialView.h"
#import "Emoji.h"
#import "PLVEmotionModel.h"

@interface FacialView ()

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic) NSBundle *emotionBundle;

@end

@implementation FacialView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
         Emoji *emoji = [Emoji new];
        _faces = [emoji allImageEmoji];
        
        //_scrollView = [[UIScrollView alloc] init];
    }
    return self;
}


//给faces设置位置
-(void)loadFacialView:(int)page size:(CGSize)size
{
	int maxRow = 5;
    int maxCol = 8;
    CGFloat itemWidth = self.frame.size.width / maxCol;
    CGFloat itemHeight = self.frame.size.height / maxRow;
    
    UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [deleteButton setBackgroundColor:[UIColor clearColor]];
    [deleteButton setFrame:CGRectMake((maxCol - 1) * itemWidth, (maxRow - 1) * itemHeight, itemWidth, itemHeight)];
    [deleteButton setImage:[UIImage imageNamed:@"faceDelete"] forState:UIControlStateNormal];
    deleteButton.tag = 10000;
    [deleteButton addTarget:self action:@selector(selected:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:deleteButton];
    
//    UIButton *sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [sendButton setTitle:NSLocalizedString(@"send", @"Send") forState:UIControlStateNormal];
//    [sendButton setFrame:CGRectMake((maxCol - 2) * itemWidth - 10, (maxRow - 1) * itemHeight + 5, itemWidth + 10, itemHeight - 10)];
//    [sendButton addTarget:self action:@selector(sendAction:) forControlEvents:UIControlEventTouchUpInside];
//    [sendButton setBackgroundColor:[UIColor colorWithRed:10 / 255.0 green:82 / 255.0 blue:104 / 255.0 alpha:1.0]];
//    [self addSubview:sendButton];
    
    
    // 初始化bundle包
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Emotion" ofType:@"bundle"];
    self.emotionBundle = [NSBundle bundleWithPath:path];
    
    for (int row = 0; row < maxRow; row++) {
        for (int col = 0; col < maxCol; col++) {
            int index = row * maxCol + col;
            if (index < [_faces count]) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                [button setBackgroundColor:[UIColor clearColor]];
                [button setFrame:CGRectMake(col * itemWidth, row * itemHeight, itemWidth, itemHeight)];
                //[button.titleLabel setFont:[UIFont fontWithName:@"AppleColorEmoji" size:29.0]];
                //[button setTitle: [_faces objectAtIndex:(row * maxCol + col)] forState:UIControlStateNormal];
                // 重写
                PLVEmotionModel *emojiModel = [_faces objectAtIndex:(row * maxCol + col)];
                [button setImage:[self imageForEmotionPNGName:emojiModel.imagePNG] forState:UIControlStateNormal];
                button.tag = row * maxCol + col;
                [button addTarget:self action:@selector(selected:) forControlEvents:UIControlEventTouchUpInside];
                
                
                [self.scrollView addSubview:button];
//                [self addSubview:button];
            }
            else{
                break;
            }
        }
    }
#warning - 待解决问题
    
    // 设置分页滑动
    // 或者设置一个UICollection
    
//    self.scrollView.contentSize 
}

#pragma mark - 重写

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        [self addSubview:_scrollView];
        _scrollView.frame = self.bounds;
        _scrollView.backgroundColor = [UIColor greenColor];
        
        _scrollView.alwaysBounceHorizontal = YES;
        
        // 使用分页
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}


-(void)selected:(UIButton*)bt
{
    if (bt.tag == 10000 && _delegate) {
        [_delegate deleteSelected:nil];
    }else{
        PLVEmotionModel *emojiModel = [_faces objectAtIndex:bt.tag];
        if (_delegate) {
            [_delegate selectedFacialView:emojiModel];
//            [_delegate selectedFacialView:str];
        }
    }
}

- (void)sendAction:(id)sender
{
    if (_delegate) {
        [_delegate sendFace];
    }
}


#pragma mark - 自定义方法

- (UIImage *)imageForEmotionPNGName:(NSString *)pngName {
    return [UIImage imageNamed:pngName inBundle:self.emotionBundle
 compatibleWithTraitCollection:nil];
}

@end
