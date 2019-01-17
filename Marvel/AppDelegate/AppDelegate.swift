//
//  AppDelegate.swift
//  Marvel
//
//  Created by Thiago Lioy on 14/11/16.
//  Copyright © 2016 Thiago Lioy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Navigation bar appearence
        ApperanceProxyHelper.customizeNavigationBar()
        
        // First screen
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        window.rootViewController = UINavigationController(rootViewController: CharactersViewController())
        self.window = window
        
        window.makeKeyAndVisible()
        
        return true
    }


}

