//
//  CommentModel.m
//  ReadMore
//
//  Created by 王雪晴 on 14-9-21.
//  Copyright (c) 2014年 wang. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel
-(void)dealloc
{
    self.value = nil;
    self.comment = nil;
    self.name = nil;
    self.create_time = nil;
    self.avatar = nil;
    [super dealloc];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
