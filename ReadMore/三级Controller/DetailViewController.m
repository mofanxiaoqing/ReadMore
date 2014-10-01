

#import "DetailViewController.h"
#import "WebViewController.h"
#import "CommentCell.h"
#import "CommentModel.h"
#import "QFHTTPManager.h"
@interface DetailViewController ()
<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
    NSMutableArray *_dataArray;//存Model
    
}

@end

@implementation DetailViewController

-(void)dealloc
{
    self.Model = nil;
    self.commentUrl = nil;
    [_dataArray release];
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    _dataArray = [[NSMutableArray alloc] init];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self makeNav];
    [self makeInfo];
    [self makeTableview];
    [self startRequest];

    
}
-(void)makeInfo
{
    self.commentUrl = [NSString stringWithFormat:URL_com,self.Model.urlid];
    self.titLabel.text = self.Model.title;
    self.titLabel.adjustsFontSizeToFitWidth = YES;
    self.companyLabel.text = self.Model.press;
    self.companyLabel.adjustsFontSizeToFitWidth = YES;
    self.dateLabel.text = self.Model.pubdate;
    if (self.Model.price != nil) {
        self.pricLabel.text = [NSString stringWithFormat:@"¥%@",self.Model.price];
    }else{
    self.pricLabel.text = @"暂无";
    }
    
    
    self.authorLabel.text = self.Model.author;
    self.authorLabel.adjustsFontSizeToFitWidth = YES;
    [self.image setImageWithURL:[NSURL URLWithString:self.Model.image]];
       for (int i = 0; i < 2; i++) {
        UIButton *btn = (UIButton *)[self.view viewWithTag:200+i];
        
        [btn addTarget:self action:@selector(webDown:) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void)webDown:(UIButton *)btn
{
    UILabel *lab = (UILabel *)[self.view viewWithTag:1001+btn.tag-200];
    lab.backgroundColor = [UIColor colorWithRed:130/255.0 green:130/255.0 blue:130/255.0 alpha:1];
    WebViewController *web = [[WebViewController alloc] init];
    web.info_url = self.Model.info_url;
    
    web.catalog_url = self.Model.catalog_url;
    
    web.btnTag = btn.tag;
    [self presentViewController:web animated:YES completion:nil];
    [web release];
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
///////////////下面的评论
-(void)makeTableview
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,221, 320, [[UIScreen mainScreen] bounds].size.height-221) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView release];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 80;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _dataArray.count;
}
-(void)startRequest
{
    [QFHTTPManager requestWithUrl:self.commentUrl FinishBlock:^(NSData *data) {
        
        
        //解析
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray *applications = dic[@"interests"];

        for(NSDictionary *appDic in applications){
            
            CommentModel *Model = [[CommentModel alloc]init];
            //星星
            NSDictionary *rat = appDic[@"rating"];
            Model.value = [NSString stringWithFormat:@"%@",rat[@"value"]];
            //comment
            Model.comment = appDic[@"comment"];
            //create_time
            Model.create_time = appDic[@"create_time"];
             //name
            NSDictionary *nameDic = appDic[@"user"];
            Model.name  = nameDic[@"name"];
             //avatar
            Model.avatar  = nameDic[@"avatar"];

            [_dataArray addObject:Model];
            [Model release];
        }
        [_tableView reloadData];
        
    } FailedBlock:^{
        NSLog(@"请求失败");
    }];
    
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CommentCell" owner:self options:nil] lastObject];
    }
    CommentModel *Model = [_dataArray objectAtIndex:indexPath.row];
    [cell.iconView setImageWithURL:[NSURL URLWithString:Model.avatar]];
    
    cell.titleLabel.text = Model.name;
   
    [cell.starView setStar:[Model.value floatValue]];
    
    cell.comLabel.text = Model.comment ;
    
    cell.timeLabel.text = [Model.create_time substringToIndex:7];
    
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 0, 200, 20)];
    view1.backgroundColor = [UIColor whiteColor];
    //
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(140, 14, 300, 20)];
    lab.text = @"评分";
    lab.textColor = [UIColor blackColor];
    [view1 addSubview:lab];
    [lab release];
    
    return [view1 autorelease];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
@end
