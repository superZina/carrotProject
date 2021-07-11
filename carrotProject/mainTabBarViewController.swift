//
//  ViewController.swift
//  carrotProject
//
//  Created by 이진하 on 2021/07/09.
//

import UIKit

class mainTabBarViewController: UITabBarController {

    //MARK: - properties
    
    let homeNC = UINavigationController(rootViewController: homeViewController())
    let lifeNC = UINavigationController(rootViewController: lifeViewController())
    let myLocNC = UINavigationController(rootViewController:  myLocationViewController())
    let chatNC = UINavigationController(rootViewController: chatViewController())
    let myPageNC = UINavigationController(rootViewController:  myPageViewController())
    
    let homeTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "home"), selectedImage: UIImage(named: "homeSelected"))
    let lifeTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "life"), selectedImage: UIImage(named: "lifeSelected"))
    let myLocTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "myLoc"), selectedImage: UIImage(named: "myLocSelected"))
    let chatTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "chat"), selectedImage: UIImage(named: "chatSelected"))
    let myPageTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "my"), selectedImage: UIImage(named: "mySelected"))
    
    var topSpacing: CGFloat {
        return UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
    }
    var tabBarHeight: CGFloat {
        return self.tabBar.frame.height
    }
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTabBarItem.title = "홈"
        lifeTabBarItem.title = "동네생활"
        myLocTabBarItem.title = "내 근처"
        chatTabBarItem.title = "채팅"
        myPageTabBarItem.title = "나의 당근"
        
        homeNC.tabBarItem = homeTabBarItem
        lifeNC.tabBarItem = lifeTabBarItem
        myLocNC.tabBarItem = myLocTabBarItem
        chatNC.tabBarItem = chatTabBarItem
        myPageNC.tabBarItem = myPageTabBarItem
        
        let appearance = tabBar.standardAppearance
        appearance.backgroundColor = .white
        appearance.shadowImage = nil
        appearance.shadowColor = nil
        
        tabBar.standardAppearance = appearance;
        tabBar.tintColor = .black
        
        self.viewControllers = [ homeNC , lifeNC , myLocNC , chatNC , myPageNC ]
        selectedIndex = 2
        
    }    
}

