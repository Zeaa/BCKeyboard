//
//  PLVEmotionModel.m
//  BCKeyBoardDemo
//
//  Created by ftao on 2017/1/13.
//  Copyright © 2017年 io.hzlzh.yunshouyi. All rights reserved.
//

#import "PLVEmojiModel.h"

@implementation PLVEmojiModel

+ (instancetype)modelWithDictionary:(NSDictionary *)data {
    
    PLVEmojiModel *model = [PLVEmojiModel new];
    model.text = [NSString stringWithFormat:@"[%@]",data[@"text"]];
    model.imagePNG = data[@"image"];
    //model.codeId = data[@"id"];
    
    return model;
}

@end
