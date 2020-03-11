//
//  AppDelegate.m
//  LifeCycle
//
//  Created by Esraa Hassan on 3/5/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    printf("didFinishLaunchingWithOptions");
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
    printf("applicationWillResignActive\n");
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    printf("entered applicationDidEnterBackground\n");
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    
     printf("applicationWillEnterForeground\n");}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
     printf("applicationDidBecomeActive\n");
}


- (void)applicationWillTerminate:(UIApplication *)application {
    
    printf("applicationWillTerminate\n");
}
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    printf("willFinishLaunchingWithOptions\n");
    return YES;
    }

- (void)applicationDidFinishLaunching:(UIApplication *)application{
    printf("applicationDidFinishLaunching\n");
    
}


@end
