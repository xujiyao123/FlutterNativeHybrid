//
//  DemoRouter.m
//  Runner
//
//  Created by Jidong Chen on 2018/10/22.
//  Copyright © 2018年 The Chromium Authors. All rights reserved.
//

#import "PlatformRouterImp.h"
#import <flutter_boost/FlutterBoost.h>
#import "flutter_ios_navative-Swift.h"


@interface PlatformRouterImp()
@end

@implementation PlatformRouterImp

#pragma mark - Boost 1.5
- (void)open:(NSString *)name
   urlParams:(NSDictionary *)params
        exts:(NSDictionary *)exts
  completion:(void (^)(BOOL))completion
{
    if ([name containsString:@"_ios_"]) {
        BoostModel * model = BoostControllerConfig.controllers[name];
        UIViewController * vc = model.BoostBlockSwift(name, params, exts);
        vc.title = exts[@"title"];
        [self.navigationController pushViewController:vc animated:true];
        
    } else {
        FLBFlutterViewContainer *vc = FLBFlutterViewContainer.new;
        vc.title = exts[@"title"];
        [vc setName:name params:params];
        [self.navigationController pushViewController:vc animated:true];
        
    }
    if(completion) completion(YES);
}

- (void)present:(NSString *)name
   urlParams:(NSDictionary *)params
        exts:(NSDictionary *)exts
  completion:(void (^)(BOOL))completion
{
    BOOL animated = [exts[@"animated"] boolValue];
    FLBFlutterViewContainer *vc = FLBFlutterViewContainer.new;
    [vc setName:name params:params];
    [self.navigationController presentViewController:vc animated:animated completion:^{
        if(completion) completion(YES);
    }];
}

- (void)close:(NSString *)uid
       result:(NSDictionary *)result
         exts:(NSDictionary *)exts
   completion:(void (^)(BOOL))completion
{
    BOOL animated = [exts[@"animated"] boolValue];
    animated = YES;
    FLBFlutterViewContainer *vc = (id)self.navigationController.presentedViewController;
    if([vc isKindOfClass:FLBFlutterViewContainer.class] && [vc.uniqueIDString isEqual: uid]){
        [vc dismissViewControllerAnimated:animated completion:^{}];
    }else{
        [self.navigationController popViewControllerAnimated:animated];
    }
}
@end
