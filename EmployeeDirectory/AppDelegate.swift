//
//  AppDelegate.swift
//  EmployeeDirectory
//
//  Created by Gaurav Chitroda on 3/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        configureApplicationWindow()
        return true
    }
    
    private func configureApplicationWindow() {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        let employeeListVC = EmployeeListViewController()
        let rootNavigationController = UINavigationController.init(rootViewController: employeeListVC)
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
    }
}

