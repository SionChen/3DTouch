//
//  AppDelegate.m
//  3DTouch
//
//  Created by 超级腕电商 on 16/5/9.
//  Copyright © 2016年 super. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <SafariServices/SafariServices.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //3D Touch 分为重压和轻压手势, 分别称作POP(第一段重压)和PEEK(第二段重压), 外面的图标只需要POP即可.
    //POP手势图标初始化
    //使用系统自带图标

    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd];
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare];
    //使用自己的图片
//    UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"自己的图片"];
    
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc]initWithType:@"item1" localizedTitle:@"标题1" localizedSubtitle:nil icon:icon1 userInfo:nil];
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc]initWithType:@"item2" localizedTitle:@"标题2" localizedSubtitle:nil icon:icon2 userInfo:nil];
    
    NSArray *array = @[item1,item2];
    [UIApplication sharedApplication].shortcutItems = array;
    
    
    
    return YES;
}
#pragma mark - 3DTouch触发的方法
-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    //这里可以实现界面跳转等方法
    if ([shortcutItem.type isEqualToString:@"item1"]) {
        SFSafariViewController *sv = [[SFSafariViewController alloc]initWithURL:[NSURL URLWithString:@"http://weibo.com/5726013703/profile?topnav=1&wvr=6&is_all=1"]];
        _window.rootViewController = sv;
        NSLog(@"按压了第一个标题");
    }
    else if ([shortcutItem.type isEqualToString:@"item2"])
    {
        ViewController *vc = [[ViewController alloc]init];
        _window.rootViewController = vc;
        NSLog(@"按压了第二个标题");
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
