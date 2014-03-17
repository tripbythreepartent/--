//
//  AppDelegate.m
//  项目
//
//  Created by 啊啊 on 14-3-3.
//  Copyright (c) 2014年 cuty. All rights reserved.
//

#import "AppDelegate.h"
#import "TripViewController.h"
#import "MyViewController.h"
#import "EditLogViewController.h"
#import "ExampleViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <shareSDK/ShareSDK.h>




@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    [MAMapServices sharedServices].apiKey = @"ecd61e07e18fd1d502ee344065500c6e";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(createAnimation) name:@"CREATEANIMATION" object:nil];
    
    
//    [self deleteAll];
    [self createAnimation];
    
    [ShareSDK registerApp:@"api20"];
    
    [self ShareSDK];
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)ShareSDK{
    
    //添加新浪微博应用
    [ShareSDK connectSinaWeiboWithAppKey:@"3838652565"
                               appSecret:@"133f5f82a737496cfcd3ba1f25a4de0b"
                             redirectUri:@"http://breadtrip.com/downloads/"];
    
    //添加腾讯微博应用
    [ShareSDK connectTencentWeiboWithAppKey:@"801307650"
                                  appSecret:@"ae36f4ee3946e1cbb98d6965b0b2ff5c"
                                redirectUri:@"http://www.sharesdk.cn"];
    
    //添加QQ空间应用
    [ShareSDK connectQZoneWithAppKey:@"100371282"
                           appSecret:@"aed9b0303e3ed1e27bae87c33761161d"];
    
    //添加网易微博应用
    [ShareSDK connect163WeiboWithAppKey:@"T5EI7BXe13vfyDuy"
                              appSecret:@"gZxwyNOvjFYpxwwlnuizHRRtBRZ2lV1j"
                            redirectUri:@"http://www.shareSDK.cn"];
    
    //添加搜狐微博应用
    [ShareSDK connectSohuWeiboWithConsumerKey:@"SAfmTG1blxZY3HztESWx"
                               consumerSecret:@"yfTZf)!rVwh*3dqQuVJVsUL37!F)!yS9S!Orcsij"
                                  redirectUri:@"http://www.sharesdk.cn"];
    
    //添加豆瓣应用
    [ShareSDK connectDoubanWithAppKey:@"07d08fbfc1210e931771af3f43632bb9"
                            appSecret:@"e32896161e72be91"
                          redirectUri:@"http://dev.kumoway.com/braininference/infos.php"];
    
    //添加人人网应用
    [ShareSDK connectRenRenWithAppKey:@"fc5b8aed373c4c27a05b712acba0f8c3"
                            appSecret:@"f29df781abdd4f49beca5a2194676ca4"];
    
    //添加开心网应用
    [ShareSDK connectKaiXinWithAppKey:@"358443394194887cee81ff5890870c7c"
                            appSecret:@"da32179d859c016169f66d90b6db2a23"
                          redirectUri:@"http://www.sharesdk.cn/"];
    
    //添加Instapaper应用
    [ShareSDK connectInstapaperWithAppKey:@"4rDJORmcOcSAZL1YpqGHRI605xUvrLbOhkJ07yO0wWrYrc61FA"
                                appSecret:@"GNr1GespOQbrm8nvd7rlUsyRQsIo3boIbMguAl9gfpdL0aKZWe"];
    
    //添加有道云笔记应用
    [ShareSDK connectYouDaoNoteWithConsumerKey:@"dcde25dca105bcc36884ed4534dab940"
                                consumerSecret:@"d98217b4020e7f1874263795f44838fe"
                                   redirectUri:@"http://www.sharesdk.cn/"];
    
    //添加Facebook应用
    [ShareSDK connectFacebookWithAppKey:@"107704292745179"
                              appSecret:@"38053202e1a5fe26c80c753071f0b573"];
    
    //添加Twitter应用
    [ShareSDK connectTwitterWithConsumerKey:@"mnTGqtXk0TYMXYTN7qUxg"
                             consumerSecret:@"ROkFqr8c3m1HXqS3rm3TJ0WkAJuwBOSaWhPbZ9Ojuc"
                                redirectUri:@"http://www.sharesdk.cn"];
    
    //添加搜狐随身看应用
    [ShareSDK connectSohuKanWithAppKey:@"e16680a815134504b746c86e08a19db0"
                             appSecret:@"b8eec53707c3976efc91614dd16ef81c"
                           redirectUri:@"http://sharesdk.cn"];
    
    //添加Pocket应用
    [ShareSDK connectPocketWithConsumerKey:@"11496-de7c8c5eb25b2c9fcdc2b627"
                               redirectUri:@"pocketapp1234"];
    
    //添加印象笔记应用
    [ShareSDK connectEvernoteWithType:SSEverNoteTypeSandbox
                          consumerKey:@"sharesdk-7807"
                       consumerSecret:@"d05bf86993836004"];
    
    //添加LinkedIn应用
    [ShareSDK connectLinkedInWithApiKey:@"ejo5ibkye3vo"
                              secretKey:@"cC7B2jpxITqPLZ5M"
                            redirectUri:@"http://sharesdk.cn"];
    
    //……
}

- (void)deleteAll{
    [[NSUserDefaults standardUserDefaults ] removeObjectForKey:@"everLaunched"];
    [[NSUserDefaults standardUserDefaults ] removeObjectForKey:@"firstLaunch"];
}

- (void)createAnimation{
    
    //引导动画
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
    }
    else{
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
    }
    
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]) {
        // 这里判断是否第一次
        
        self.window.rootViewController = [[ExampleViewController alloc] init];
        
        
    }else{
        EditLogViewController * log = [[EditLogViewController alloc] init];
        UINavigationController * navLog = [[UINavigationController alloc] initWithRootViewController:log];
        navLog.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"日志" image:Nil tag:100];
        
        TripViewController * trip = [[TripViewController alloc] init];
        UINavigationController * navTrip = [[UINavigationController alloc] initWithRootViewController:trip];
        navTrip.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"旅行" image:Nil tag:200];
        
        MyViewController * my = [[MyViewController alloc] init];
        UINavigationController * navMy = [[UINavigationController alloc] initWithRootViewController:my];
        navMy.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:Nil tag:300];
        
        
        NSMutableArray * array = [[NSMutableArray alloc] init];
        [array addObject:navLog];
        [array addObject:navTrip];
        [array addObject:navMy];
        
        UITabBarController * tab = [[UITabBarController alloc] init];
        tab.viewControllers = array;
        
        tab.selectedViewController = navTrip;
        
        [_window setRootViewController:tab];
        
        [log release];
        [navLog.tabBarItem release];
        [trip release];
        [navTrip.tabBarItem release];
        [my release];
        [navMy.tabBarItem release];
        [navMy release];
        [navLog release];
        [navTrip release];
        [tab release];
        
    }

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
