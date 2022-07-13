//
//  AppDelegate.swift
//  Notifications
//
//  Created by Alexey Efimov on 21.06.2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let notificationCenter = LocalNotification()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        notificationCenter.getPermission()
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    
   
}



