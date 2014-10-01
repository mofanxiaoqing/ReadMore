

#import "QFHTTPManager.h"

@implementation QFHTTPManager

+(void)requestWithUrl:(NSString *)url FinishBlock:(FinishBlock)finishBlock FailedBlock:(FailedBlock)failedBlock
{

    QFHTTPRequest *request = [[QFHTTPRequest alloc]init];
    request.url = url;
    request.finishBlock = finishBlock;
    request.failedBlock = failedBlock;
    [request startRequest];
}

@end
