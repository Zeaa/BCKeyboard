//
//  PLVEmotionModel.m
//  BCKeyBoardDemo
//
//  Created by ftao on 2017/1/13.
//  Copyright © 2017年 io.hzlzh.yunshouyi. All rights reserved.
//

#import "PLVEmotionModel.h"

@implementation PLVEmotionModel

+ (instancetype)modelWithDictionary:(NSDictionary *)data {
    PLVEmotionModel *model = [PLVEmotionModel new];
    
    // TEXT 需要处理下，添加[]
    model.text = data[@"text"];
    model.imagePNG = data[@"image"];
    //model.codeId = data[@"id"];
    
    return model;
}

@end
