//
//  AppDelegate.swift
//  TesteJson
//
//  Created by Alessandro on 06/09/19.
//  Copyright © 2019 Alessandro. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var mainRouter:RepositoriesRouter?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        mainRouter = RepositoriesRouter(window: window)
        
        if let mainRouter = mainRouter{
            mainRouter.list()
        }
        
        return true
    }
    
    
    
    
}

