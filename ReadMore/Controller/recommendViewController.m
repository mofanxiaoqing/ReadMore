

#import "recommendViewController.h"
#import "DetailViewController.h"
@interface recommendViewController ()

@end

@implementation recommendViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self startRequest];
}
-(void)startRequest
{
    NSString *url = @"https://frodo.douban.com/api/book/explore?apiKey=0dad551ec0f84ed02907ff5c42e8ec70&count=30%20HTTP/1.1";
    [QFHTTPManager requestWithUrl:url FinishBlock:^(NSData *data) {
         //解析
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray *arrs = dic[@"charts"];
        for (NSDictionary *temp in arrs) {
            NSArray *applications = temp[@"subjects"];
            NSMutableArray *rowArr = [NSMutableArray arrayWithCapacity:0];
            for(NSDictionary *appDic in applications){
                
                CategoryModel *Model = [[CategoryModel alloc]init];
                //目录
                Model.catalog_url = appDic[@"catalog_url"];
                //出版信息与简介
                Model.info_url = appDic[@"info_url"];
                //评论
                Model.urlid = appDic[@"id"];

                //title
                Model.title = appDic[@"title"];
                //pudate
                NSArray* pudateArr = appDic[@"pubdate"];
                 Model.pubdate = pudateArr[0];
                //value
                NSDictionary *valueDic = appDic[@"rating"];
                 Model.value = valueDic[@"value"];
                //image
                Model.image = appDic[@"image"];
                //author
                NSArray* authorArr = appDic[@"author"];
                 Model.author = authorArr[0];
                //press
                NSArray* pressArr = appDic[@"press"];
                Model.press = pressArr[0];
                //价格
                NSArray* priceArr = appDic[@"price"];
                Model.price = priceArr[0];
                [rowArr addObject:Model];
                [Model release];
            }
            [_dataArray addObject:rowArr];
            
        }
        
        
        [_tableView reloadData];
        
    } FailedBlock:^{
        NSLog(@"请求失败");
    }];
    
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CategoryCell" owner:self options:nil] lastObject];
    }
    
//    
   CategoryModel *Model = [[_dataArray objectAtIndex:indexPath.section ]objectAtIndex:indexPath.row];

    [cell.iconView setImageWithURL:[NSURL URLWithString:Model.image]];
    cell.titleLabel.text = Model.title;
    [cell.starView setStar:[Model.value floatValue]];
    float temp = [Model.value floatValue];
    cell.scoreLabel.text = [NSString stringWithFormat:@"%.2f分",temp];
    
    cell.placeLabel.text = [NSString stringWithFormat:@"%@",Model.pubdate] ;
    
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSArray *Arr = @[@"新书",@" 高分",@"热门"];
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 0, 300, 40)];
    view1.backgroundColor = [UIColor clearColor];
    //
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 300, 20)];
    lab.text = Arr[section];
    [view1 addSubview:lab];
    [lab release];
    
    lab.textColor = [UIColor magentaColor];
    
    
    return [view1 autorelease];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray[section] count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryModel *Model = [[_dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    //跳转到详情页面
    DetailViewController* detailVC = [[DetailViewController alloc] init];
    
    detailVC.Model = Model;
    [self presentViewController:detailVC animated:YES completion:nil];
    [detailVC release];
}

@end
