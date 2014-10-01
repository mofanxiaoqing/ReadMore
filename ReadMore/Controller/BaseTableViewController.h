
#import "BaseViewController.h"
#import "CategoryCell.h"
#import "CategoryModel.h"
@interface BaseTableViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
    NSMutableArray *_dataArray;//存Model
   
}

@end
