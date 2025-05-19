//
//  MainTabBarController.swift
//  Podcast_Swift
//
//  Created by Abdul Basit on 14/05/2025.
//
import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .purple
        UINavigationBar.appearance().prefersLargeTitles = true
        
        viewControllers = [
            generateNavigationController(with: PodcastSearchController(), title: "Search", image: UIImage(systemName: "magnifyingglass")!),
            generateNavigationController(with: UIViewController(), title: "Favorites", image: UIImage(systemName: "star")!),
            generateNavigationController(with: UIViewController(), title: "Downloads", image: UIImage(systemName: "square.and.arrow.down.on.square.fill")!)
        ]
    }
    
    // MARK: - Functions
    func generateNavigationController(with rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController{
        let navController = UINavigationController(rootViewController: rootViewController)
//        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
    
}
