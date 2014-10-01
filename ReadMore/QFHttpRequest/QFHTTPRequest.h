

#import <Foundation/Foundation.h>

typedef void(^FinishBlock)(NSData *data);
typedef void(^FailedBlock) ();//代表类型

@interface QFHTTPRequest : NSObject<NSURLConnectionDataDelegate>
{
    NSMutableData *_mData;
    
}
@property(nonatomic,copy)NSString *url;//NSString用copy
@property(nonatomic,copy)FinishBlock finishBlock;//block也要用copy修饰
@property(nonatomic,copy)FailedBlock failedBlock;
//开始请求
-(void)startRequest;
@end
