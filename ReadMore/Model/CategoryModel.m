

#import "CategoryModel.h"

@implementation CategoryModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
-(void)dealloc
{
    self.title = nil;
    self.press = nil;
    self.author = nil;
    self.value = nil;
    self.pubdate = nil;
    self.image = nil;
    self.info_url = nil;
    self.catalog_url = nil;
    self.price = nil;
    self.urlid = nil;
    [super dealloc];
}
@end
