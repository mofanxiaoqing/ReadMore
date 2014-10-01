//
//  StarView.m
//  星级视图
//
//  Created by qianfeng66 on 14-8-29.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "StarView.h"

@implementation StarView
-(void)createImage
{
    backgroundImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"StarsBackground"]];
    backgroundImageView.frame = CGRectMake(0, 0, 65, 23);
    backgroundImageView.contentMode = UIViewContentModeLeft;
    foregroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StarsForeground"]];
    foregroundImageView.frame = CGRectMake(0, 0, 65, 23);
    //设置内容的对齐方式
    foregroundImageView.contentMode = UIViewContentModeLeft;
    //如果子视图超出父视图大小时被裁剪掉
    foregroundImageView.clipsToBounds = YES;
    [self addSubview:backgroundImageView];
    [self addSubview:foregroundImageView];
    self.backgroundColor = [UIColor clearColor];

}
//给xib创建这个类对象时用的方法
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self createImage];
    }
    return self;
}
-(void)setStar:(CGFloat)star
{
   CGRect frame = backgroundImageView.frame;
   frame.size.width = frame.size.width/10*(star+2);
    foregroundImageView.frame = frame;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self createImage];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
