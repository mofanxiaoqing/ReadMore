

#import "QFHTTPRequest.h"

@implementation QFHTTPRequest
-(void)dealloc
{
    self.url = nil;
    [_mData release];
    [super dealloc];
}
-(void)startRequest
{
    _mData = [[NSMutableData alloc] init];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    [NSURLConnection connectionWithRequest:request delegate:self];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_mData appendData:data];
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;//状态栏上得小圈圈  一直在转
    
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    self.failedBlock();

}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
//回调 传值
    self.finishBlock(_mData);//finishBlock是一个指针
    
}
@end
