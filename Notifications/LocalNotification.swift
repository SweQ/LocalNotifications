//
//  LocalNotification.swift
//  Notifications
//
//  Created by alexKoro on 13.07.22.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation
import UserNotifications

class LocalNotification: NSObject {
    private let notificationCenter = UNUserNotificationCenter.current()
    
    override init() {
        super.init()
        notificationCenter.delegate = self
    }
    
    func getPermission() {
        notificationCenter.requestAuthorization(
            options: [.sound, .badge, .alert]) { permissionGot, _ in
                if permissionGot {
                    print("Permission got.")
                } else {
                    print("Permission not got.")
                }
            }
    }
    
    func runNotification(title: String, body: String, after seconds: Double) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.badge = 1
        
        addActionsToNotification(content: content)
        
        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: seconds,
            repeats: false
        
        )
        let request = UNNotificationRequest(
            identifier: "requestNotification",
            content: content,
            trigger: trigger
        )
        notificationCenter.add(request)
    }
    
    func addActionsToNotification(content: UNMutableNotificationContent) {
        //max = 4 actions
        let categoryId = "notificationCategory"
        let action1 = UNNotificationAction(identifier: "Action1", title: "I Action1", options: [.foreground])
        let action2 = UNNotificationAction(identifier: "Action2", title: "I action2", options: [.foreground])
        
        let category = UNNotificationCategory(
            identifier: categoryId,
            actions: [action1, action2],
            intentIdentifiers: [],
            options: []
        )
        
        content.categoryIdentifier = categoryId
        notificationCenter.setNotificationCategories([category])
    }
}

extension LocalNotification: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        switch response.actionIdentifier {
        case "Action1":
            print("Pressed Action1")
        case "Action2":
            print("Pressed Action2")
        default:
            print("Pressed \(response.actionIdentifier)")
        }
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .sound, .alert])
    }
}
