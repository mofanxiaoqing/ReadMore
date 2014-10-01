
#import "MyViewController.h"

@interface MyViewController ()
@property(nonatomic,copy)NSArray *nameArray;
@end

@implementation MyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
   self.nameArray = @[@[@"设置",@"登陆"],@[ @"好友分享",@"我的消息",@"我的收藏"], @[@"离线下载",@"清除缓存"], @[ @"应用推荐",@"关于我们"]];
    }
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        
    }
    cell.textLabel.text = self.nameArray[indexPath.section][indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:16];
 
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.nameArray[section] count];
   
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.nameArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}
@end
