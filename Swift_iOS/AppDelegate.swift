//
//  AppDelegate.swift
//  Swift_iOS
//
//  Created by LuisX on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        //加载根视图控制器
        let homeVC = HomeViewController()
        let homeNaVC = UINavigationController.init(rootViewController: homeVC)
        let homeNormalPic = UIImage(named: "ui_normal@2x.png")
        let homeSelectedPic = UIImage(named: "ui_selected@2x.png")
        homeNaVC.tabBarItem = UITabBarItem(title: "UI", image: homeNormalPic, selectedImage: homeSelectedPic)
        
        let secondVC = SceondViewController()
        let secondNaVC = UINavigationController(rootViewController: secondVC)
        let baseNormalPic = UIImage(named: "base_normal@2x.png")
        let baseSelectedPic = UIImage(named: "base_selected@2x.png")
        secondNaVC.tabBarItem = UITabBarItem(title: "语法", image: baseNormalPic, selectedImage: baseSelectedPic)
        
        let rootTabBarC = UITabBarController()
        rootTabBarC.viewControllers = [homeNaVC, secondNaVC]
        self.window?.rootViewController = rootTabBarC
        
        //全局
        UINavigationBar.appearance().backgroundColor = UIColor.red
    
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

