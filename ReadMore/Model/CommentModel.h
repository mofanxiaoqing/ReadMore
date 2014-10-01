//
//  CommentModel.h
//  ReadMore
//
//  Created by 王雪晴 on 14-9-21.
//  Copyright (c) 2014年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentModel : NSObject
@property(nonatomic,copy)NSString *value;//星星
@property(nonatomic,copy)NSString *comment;//评论
@property(nonatomic,copy)NSString *name;//名字
@property(nonatomic,copy)NSString *create_time;//日期
@property(nonatomic,copy)NSString *avatar;//图片
- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
@end
