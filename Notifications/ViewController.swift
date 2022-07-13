//
//  UIViewController.swift
//  Notifications
//
//  Created by alexKoro on 13.07.22.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    @IBAction func createButtonPressed(_ sender: UIButton) {
        guard let appDelegate = appDelegate else { return }
        appDelegate.notificationCenter.runNotification(
            title: "Some title",
            body: "Some body",
            after: 2
        )
    }
    
}
