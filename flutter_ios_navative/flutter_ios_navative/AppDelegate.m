//
//  AppDelegate.m
//  flutter_ios_navative
//
//  Created by 徐继垚 on 2019/11/27.
//  Copyright © 2019 徐继垚. All rights reserved.
//

#import "AppDelegate.h"
#import "flutter_ios_navative-Swift.h"
#import <flutter_boost/FlutterBoost.h>
#import "PlatformRouterImp.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    PlatformRouterImp * router = PlatformRouterImp.new;
    [FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:router onStart:^(FlutterEngine *engine) {
        NSLog(@"engine------%@" , engine);
    }];
    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:MainViewController.new];
    router.navigationController = nav;
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}



@end
