//
//  AppDelegate.swift
//  TestSwiftUI
//
//  Created by user on 2017/4/20.
//  Copyright © 2017年 Annie Hou. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        UMSocialManager.default().openLog(true)
        UMSocialGlobal.shareInstance().isClearCacheWhenGetUserInfo = false
        UMSocialManager.default().umSocialAppkey = "5861e5daf5ade41326001eab"
//        UMSocialManager.default().setPlaform(UMSocialPlatformType.wechatSession, appKey: "wxdc1e388c3822c80b", appSecret: "3baf1193c85774b3fd9d18447d76cab0", redirectURL: "http://mobile.umeng.com/social")
//        UMSocialManager.default().setPlaform(UMSocialPlatformType.QQ, appKey: "1105821097", appSecret: nil, redirectURL: "http://mobile.umeng.com/social")
        UMSocialManager.default().setPlaform(UMSocialPlatformType.wechatFavorite, appKey: "wxdc1e388c3822c80b", appSecret: "3baf1193c85774b3fd9d18447d76cab0", redirectURL: "http://mobile.umeng.com/social")
        UMSocialManager.default().setPlaform(UMSocialPlatformType.QQ, appKey: "1105821097", appSecret: nil, redirectURL: "http://mobile.umeng.com/social")
        
        let vc = ViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.setNavigationBarHidden(true, animated: true)
        nav.navigationBar.isTranslucent = false
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        self.window?.backgroundColor = UIColor.white
        
        
        
        
        
        
        return true
    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        let result = UMSocialManager.default().handleOpen(url, options: options)
        if !result {
            // 其他如支付等SDK的回调
        }
        return result
    }
    
    
    
    
//    #if __IPHONE_OS_VERSION_MAX_ALLOWED > 100000
//    - (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
//    {
//    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响。
//    BOOL result = [[UMSocialManager defaultManager]  handleOpenURL:url options:options];
//    if (!result) {
//    // 其他如支付等SDK的回调
//    }
//    return result;
//    }
//    
//    #endif
//    
//    - (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
//    {
//    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
//    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
//    if (!result) {
//    // 其他如支付等SDK的回调
//    }
//    return result;
//    }
//    
//    - (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
//    {
//    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
//    if (!result) {
//    // 其他如支付等SDK的回调
//    }
//    return result;
//    }
//    
    
    
    
    
    
    
    
    
    
    
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

