
#import <Foundation/Foundation.h>

@interface CategoryModel : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *pubdate;//时间
@property(nonatomic,copy)NSString *author;
@property(nonatomic,copy)NSString *value;//评分
@property(nonatomic,copy)NSString *press;//出版社
@property(nonatomic,copy)NSString *image;//图片
//评论
@property(nonatomic,copy)NSString *urlid;
//下面为四级页面准备的
@property(nonatomic,copy)NSString *info_url;//出版信息和简介
@property(nonatomic,copy)NSString *catalog_url;//目录
@property(nonatomic,copy)NSString *price;//价格
- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
@end

