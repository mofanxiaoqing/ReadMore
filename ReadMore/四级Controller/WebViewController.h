//
//  WebViewController.h
//  ReadMore
//
//  Created by qianfeng66 on 14-9-19.
//  Copyright (c) 2014年 wang. All rights reserved.
//

#import "BaseViewController.h"

@interface WebViewController : BaseViewController
@property(nonatomic,copy)NSString *info_url;
@property(nonatomic,copy)NSString *catalog_url;
@property(nonatomic,assign)int btnTag;
@end
