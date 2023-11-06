//
//  ViewController.swift
//  NewRwcipeApp
//
//  Created by Gizem Turker on 2.08.2022.
//

import UIKit

class MainTabBarViewController : UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        
        let apiCaller = APICaller(networking: NetworkService())
        
        let vc1 = UINavigationController(rootViewController: HomeViewController(apiCaller: apiCaller))
        let vc2 = UINavigationController(rootViewController: SearchViewController())
        let vc3 = UINavigationController(rootViewController: CreateViewController())
        let vc4 = UINavigationController(rootViewController: ShoppingViewController())
        let vc5 = UINavigationController(rootViewController: ProfileViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc3.tabBarItem.image = UIImage(systemName: "plus.circle")
        vc4.tabBarItem.image = UIImage(systemName: "checklist")
        vc5.tabBarItem.image = UIImage(systemName: "person")
        
        vc1.title = ""
        vc2.title = "Search"
        vc3.title = "Create"
        vc4.title = "Shopping List"
        vc5.title = "Profile"
        
        tabBar.tintColor = .systemPink
        
        
       setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
        
    }


}

