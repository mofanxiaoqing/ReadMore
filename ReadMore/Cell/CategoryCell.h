
#import <UIKit/UIKit.h>
#import "StarView.h"
@interface CategoryCell : UITableViewCell
@property(nonatomic,assign) IBOutlet UIImageView *iconView;
@property(nonatomic,assign)IBOutlet UILabel *titleLabel;
@property (assign, nonatomic) IBOutlet StarView *starView;
@property(nonatomic,assign)IBOutlet UILabel *scoreLabel;
@property(nonatomic,assign)IBOutlet UILabel *placeLabel;
@end

