//
//  RepositoriesRouter.swift
//  TesteJson
//
//  Created by Alessandro on 06/09/19.
//  Copyright © 2019 Alessandro. All rights reserved.
//

import Foundation
import UIKit

protocol RepositoriesRouterProtocol {
    func list()
}


class RepositoriesRouter: UINavigationController, RepositoriesRouterProtocol {
    
    // MARK: Properties
    
    var window: UIWindow?
    var repositoriesViewController:RepositoriesViewController?
    
    // MARK: Initializers
    
    convenience init(window: UIWindow?) {
        self.init()
        self.window = window
    }
    
    
    // MARK: Functions
    
    func list() {
        
        repositoriesViewController = RepositoriesViewController()
        if let repositoriesViewController = repositoriesViewController {
            repositoriesViewController.navigationItem.title = "Repositórios"
            repositoriesViewController.title = "Repositórios"
            viewControllers = [repositoriesViewController]
        }
        
        if let window = window {
            window.rootViewController = self
        }
    }
}
