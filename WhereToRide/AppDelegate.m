//
//  AppDelegate.m
//  WhereToRide
//
//  Created by 冷锐鹏 on 2022/3/28.
//

#import "AppDelegate.h"
#import "OfficialViewController.h"
#import "UserLikeViewController.h"
#import "MyViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    
    OfficialViewController *officialViewController = [[OfficialViewController alloc]init];
    
    UserLikeViewController *userLikeViewController = [[UserLikeViewController alloc]init];
    userLikeViewController.title = @"骑士推荐";
    MyViewController *myViewController = [[MyViewController alloc]init];
    myViewController.title = @"我的";
    [tabBarController setViewControllers:@[officialViewController,userLikeViewController,myViewController]];
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:tabBarController];
    [self.window setRootViewController:navigationController];
    [self.window makeKeyAndVisible];
    return YES;
}


-(void)applicationWillResignActive:(UIApplication *)application{}
-(void)applicationDidEnterBackground:(UIApplication *)application{}
-(void)applicationWillEnterForeground:(UIApplication *)application{}
-(void)applicationDidBecomeActive:(UIApplication *)application{}
- (void)applicationWillTerminate:(UIApplication *)application{}


@end
