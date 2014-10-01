

#import "BaseViewController.h"
#import "CategoryModel.h"
@interface DetailViewController : BaseViewController
@property (nonatomic, retain) CategoryModel* Model;

@property (nonatomic, assign) IBOutlet UILabel* titLabel;

@property (nonatomic, assign) IBOutlet UILabel* companyLabel;
@property (nonatomic, assign) IBOutlet UILabel* dateLabel;
@property (nonatomic, assign) IBOutlet UILabel* pricLabel;
@property (nonatomic, assign) IBOutlet UILabel* authorLabel;
@property (nonatomic, assign) IBOutlet UIImageView *image;
@property(nonatomic,copy)NSString *commentUrl;
@end
