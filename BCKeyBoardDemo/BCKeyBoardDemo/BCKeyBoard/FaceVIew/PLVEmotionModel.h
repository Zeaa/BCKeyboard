//
//  PLVEmotionModel.h
//  BCKeyBoardDemo
//
//  Created by ftao on 2017/1/13.
//  Copyright © 2017年 io.hzlzh.yunshouyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PLVEmotionModel : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *imagePNG; //png资源名称

@property (nonatomic) NSString *codeId;         //表情ID


// 根据字典生成一个表情模型
+ (instancetype)modelWithDictionary:(NSDictionary *)data;

@end


