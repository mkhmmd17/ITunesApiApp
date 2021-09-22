//
//  BaseTapBarController.swift
//  AppStore
//
//  Created by muslim on 18.09.2021.
//

import UIKit

class BaseTapBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todayController = UIViewController()
        todayController.view.backgroundColor = .white
        todayController.navigationItem.title = "Today"
        
        let todayNavController = UINavigationController(rootViewController: todayController)
        todayNavController.tabBarItem.title = "Today"
        todayNavController.tabBarItem.image = #imageLiteral(resourceName: "today_icon")
        todayNavController.navigationBar.prefersLargeTitles = true
    
        viewControllers = [
            createViewController(viewController: AppsPageController(), title: "Apps", imageName: "apps"),
            createViewController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
            createViewController(viewController: AppsSearchController(), title: "Search", imageName: "search")
        ]
        
    }
    
    fileprivate func createViewController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        
        return navController
        
    }
}
