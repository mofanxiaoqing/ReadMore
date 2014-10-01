//
//  WebViewController.m
//  ReadMore
//
//  Created by qianfeng66 on 14-9-19.
//  Copyright (c) 2014年 wang. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>{
    UIWebView* _webView;
    NSString *_url;
}


@end

@implementation WebViewController
-(void)dealloc
{
    [_webView release];
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self makeNav];
    [self makeWebView];
    
}
-(void)makeWebView
{
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 60, 320, self.view.frame.size.height-60)];
    _webView.delegate = self;
    [self.view addSubview:_webView];
    if (self.btnTag == 200) {
        _url = self.info_url;
    }else
    {
        _url = self.catalog_url;
    }
   
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:_url]];

    [_webView loadRequest:request];

}
-(void)makeNav
{
    //返回的按钮
    UIButton *btn =  [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 10, 40, 40);
    [btn setImage:[UIImage imageNamed:@"circle_icon_back"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnDown) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)btnDown
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
