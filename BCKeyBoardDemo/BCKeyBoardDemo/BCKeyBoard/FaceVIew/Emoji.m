//
//  Emoji.m
//  Emoji
//
//  Created by Aliksandr Andrashuk on 26.10.12.
//  Copyright (c) 2012 Aliksandr Andrashuk. All rights reserved.
//

#import "Emoji.h"
#import "EmojiEmoticons.h"
#import "PLVEmotionModel.h"

@interface Emoji ()

// 存放表情的字典
@property (nonatomic) NSMutableDictionary *emotionDictionary;

// 存放表情模型的数组
@property (nonatomic) NSMutableArray<PLVEmotionModel *> *allEmotionModels;

@end

@implementation Emoji

+ (NSString *)emojiWithCode:(int)code {
    int sym = EMOJI_CODE_TO_SYMBOL(code);
    return [[NSString alloc] initWithBytes:&sym length:sizeof(sym) encoding:NSUTF8StringEncoding];
}

- (NSArray *)allImageEmoji {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Emotions" ofType:@"plist"];
    NSArray<NSDictionary *> *groups = [NSArray arrayWithContentsOfFile:path];   // 获取到plist中的文件内容

    for (NSDictionary *group in groups) {
        
        if ([group[@"type"] isEqualToString:@"emoji"]) {
        
            self.emotionDictionary = [NSMutableDictionary dictionary];
            self.allEmotionModels = [NSMutableArray new];
            NSArray<NSDictionary *> *items = group[@"items"];
            for (NSDictionary *item in items) {
                
                PLVEmotionModel *model = [PLVEmotionModel modelWithDictionary:item];
            
                // 两种方式保存数据
                [self.allEmotionModels addObject:model];
                self.emotionDictionary[model.text] = model.imagePNG;
            }
        }
    }
    
    return self.allEmotionModels;
}

+ (NSArray *)allEmoji {
    NSMutableArray *array = [NSMutableArray new];
    [array addObjectsFromArray:[EmojiEmoticons allEmoticons]];
    return array;
}
@end
