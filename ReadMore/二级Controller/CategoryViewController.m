
#import "CategoryViewController.h"
#import "DetailViewController.h"
@interface CategoryViewController ()

@end

@implementation CategoryViewController

-(void)dealloc
{
    self.url = nil;
    self.name = nil;
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = self.name;
   
    
    [self setUrl];
    [self startRequest];
}
-(void)setUrl
{
    NSArray *urlArr = @[URL_1,URL_2,URL_3,URL_4,URL_5,URL_6,URL_7,URL_8,URL_9,URL_10,URL_11,URL_12];
    self.url = urlArr[self.tag-100];
    
}
-(void)startRequest
{
    [QFHTTPManager requestWithUrl:self.url FinishBlock:^(NSData *data) {
       

        //解析
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray *applications = dic[@"subjects"];
        //title  pubdate;//时间  author  value;//评分  press;//出版社  image;//图片
        for(NSDictionary *appDic in applications){
            
            CategoryModel *Model = [[CategoryModel alloc]init];
            //评论
            Model.urlid = appDic[@"id"];
            //目录
            Model.catalog_url = appDic[@"catalog_url"];
            //出版信息与简介
            Model.info_url = appDic[@"info_url"];
            //价格
            NSArray* priceArr = appDic[@"price"];
            Model.price = priceArr[0];
            //title
            Model.title  = appDic[@"title"];
            
            //author
            NSArray* authorArr = appDic[@"author"];
            Model.author = authorArr[0];
            //pudate
            NSArray* pudateArr = appDic[@"pubdate"];
            Model.pubdate = pudateArr[0];
            //value
            NSDictionary *valueDic = appDic[@"rating"];
            Model.value = valueDic[@"value"];
            //press
            NSArray* pressArr = appDic[@"press"];
            Model.press = pressArr[0];
            //image
            Model.image = appDic[@"image"];
            
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
    CategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CategoryCell" owner:self options:nil] lastObject];
    }
    CategoryModel *Model = [_dataArray objectAtIndex:indexPath.row];
    
    [cell.iconView setImageWithURL:[NSURL URLWithString:Model.image]];
    cell.titleLabel.text = Model.title;
    [cell.starView setStar:[Model.value floatValue]];
    float temp = [Model.value floatValue];
    cell.scoreLabel.text = [NSString stringWithFormat:@"%.2f分",temp];
   
    cell.placeLabel.text = [NSString stringWithFormat:@"%@/%@/%@",Model.author,Model.press,Model.pubdate] ;
        
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 0, 200, 20)];
    view1.backgroundColor = [UIColor clearColor];
    //
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(80, 14, 300, 20)];
    lab.text = @"在这里多看看哦！";
    lab.textColor = [UIColor magentaColor];
    [view1 addSubview:lab];
    [lab release];
    
    return [view1 autorelease];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryModel *Model = [_dataArray objectAtIndex:indexPath.row];
    //跳转到详情页面
    DetailViewController* detailVC = [[DetailViewController alloc] init];
   
    detailVC.Model = Model;
    [self presentViewController:detailVC animated:YES completion:nil];
    [detailVC release];
}

@end
