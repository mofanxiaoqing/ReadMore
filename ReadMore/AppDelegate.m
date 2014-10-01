

#import "AppDelegate.h"
#import "SubScribedViewController.h"
#import "recommendViewController.h"
#import "MyViewController.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    //
    [NSThread sleepForTimeInterval:5];
    //隐藏状态栏
    //[UIApplication sharedApplication].statusBarHidden = YES;
    [self makeNavAndTabbar];
    
    //
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)makeNavAndTabbar
{
    
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"navBar.png"] forBarMetrics:UIBarMetricsDefault];
    SubScribedViewController *svc = [[[SubScribedViewController alloc] init] autorelease];
    recommendViewController *rvc = [[[recommendViewController alloc] init] autorelease];
    MyViewController *myvc = [[[MyViewController alloc] init] autorelease];
    NSMutableArray *array = [NSMutableArray arrayWithObjects:svc,rvc,myvc, nil];
    NSArray *titleArr = @[@"订阅",@"推荐",@"我的"];
    NSArray *picTitleArr = @[@"subscribe",@"recommend",@"my"];
    for (int i = 0; i<array.count; i++) {
        
        UIViewController *vc = [array objectAtIndex:i];
        vc.title = titleArr[i];
        UINavigationController *nc = [[[UINavigationController alloc]initWithRootViewController:vc]autorelease];
        [ nc.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
        [array replaceObjectAtIndex:i withObject:nc];
        if (IOS7) {
            nc.tabBarItem.image = [[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%@.png",picTitleArr[i]]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            nc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%@_orange.png",picTitleArr[i]]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }
        
    }
    UITabBarController *tc = [[UITabBarController alloc]init];
    [tc.tabBar setBackgroundImage:[UIImage imageNamed:@"navBar.png"]];
    [tc.tabBar setTintColor:[UIColor colorWithRed:236/255.0 green:96/255.0 blue:0 alpha:1]];
    tc.viewControllers = array;
    self.window.rootViewController = tc;
    [tc release];
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
