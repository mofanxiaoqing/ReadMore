

#import <Foundation/Foundation.h>
#import "QFHTTPRequest.h"
@interface QFHTTPManager : NSObject

+(void)requestWithUrl:(NSString *)url FinishBlock:(FinishBlock)finishBlock FailedBlock:(FailedBlock)failedBlock;

@end
