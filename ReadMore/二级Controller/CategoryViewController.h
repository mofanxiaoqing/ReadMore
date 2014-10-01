
#import "BaseTableViewController.h"

@interface CategoryViewController : BaseTableViewController
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)int tag;
-(void)setUrl;
-(void)startRequest;
@end
