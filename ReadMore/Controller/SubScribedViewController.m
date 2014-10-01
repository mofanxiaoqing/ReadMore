
#import "SubScribedViewController.h"
#import "CategoryViewController.h"
@interface SubScribedViewController ()

@end

@implementation SubScribedViewController

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
    
    for (int i = 0; i < 12; i++) {
        UIButton *btn = (UIButton *)[self.view viewWithTag:100+i];
        [btn addTarget:self action:@selector(btnDown:) forControlEvents:UIControlEventTouchUpInside];
        
    }
}
-(void)btnDown:(UIButton *)btn
{
    CategoryViewController *catvc = [[CategoryViewController alloc] init];
    catvc.name = btn.titleLabel.text;
    catvc.tag = btn.tag;
    [self.navigationController pushViewController:catvc animated:YES];
    [catvc release];
}

@end
