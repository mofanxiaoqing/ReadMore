

#import "BaseTableViewController.h"
@interface BaseTableViewController ()

@end

@implementation BaseTableViewController
-(void)dealloc
{
    [_dataArray release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _dataArray = [[NSMutableArray alloc] init];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self makeTableview];
    
}

-(void)makeTableview
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, [[UIScreen mainScreen] bounds].size.height-64-49) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView release];

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}



@end
