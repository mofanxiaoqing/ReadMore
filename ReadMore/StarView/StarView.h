//
//  StarView.h
//  星级视图
//
//  Created by qianfeng66 on 14-8-29.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView
{
//背景图
    UIImageView *backgroundImageView;
    //前景图
    UIImageView *foregroundImageView;
    
    
}
//设置星级
-(void)setStar:(CGFloat)star;

@end
