//
//  CommentCell.h
//  ReadMore
//
//  Created by 王雪晴 on 14-9-21.
//  Copyright (c) 2014年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarView.h"
@interface CommentCell : UITableViewCell
@property(nonatomic,assign) IBOutlet UIImageView *iconView;
@property(nonatomic,assign)IBOutlet UILabel *titleLabel;
@property (assign, nonatomic) IBOutlet StarView *starView;
@property(nonatomic,assign)IBOutlet UILabel *comLabel;
@property(nonatomic,assign)IBOutlet UILabel *timeLabel;
@end
