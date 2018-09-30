//
//  AppDelegate.swift
//  Westeros
//
//  Created by Fco_Javier_Rodriguez on 26/9/18.
//  Copyright © 2018 Fco_Javier_Rodriguez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var houseDetailNavitagionController: UINavigationController!
    var seasonDetailNavigationController: UINavigationController!
    var splitViewController: UISplitViewController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Models
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        
        // Master and detail
        let houseListVC = HouseListViewController(modelHouse: houses)
        let lastHouseDetailVCSelected = HouseDetailViewController(modelHouse: houseListVC.lastSelectedHouse())
        
        let seasonListVC = SeasonListViewController(modelSeasons: seasons)
        let lastSeasonDetailVCSelected = SeasonDetailViewController(modelSeason: seasonListVC.lastSelectedSeason())
        
        // Delegates according to the device
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            houseListVC.delegate = lastHouseDetailVCSelected
            seasonListVC.delegate = lastSeasonDetailVCSelected
        }else{
            houseListVC.delegate = houseListVC
            seasonListVC.delegate = seasonListVC
        }
        
        // TabBar
        // Navigations Controller (list view)
        let houseListNavigationController = houseListVC.wrappedInNavigation()
        houseDetailNavitagionController = lastHouseDetailVCSelected.wrappedInNavigation()
        
        let seasonLisNavigationController = seasonListVC.wrappedInNavigation()
        seasonDetailNavigationController = lastSeasonDetailVCSelected.wrappedInNavigation()
        
        // TabBar Controller (list view)
        let tabBar = UITabBarController()
        tabBar.viewControllers = [houseListNavigationController, seasonLisNavigationController]
        tabBar.delegate = self
        
        // SplitView
        splitViewController = UISplitViewController()
        splitViewController.viewControllers = [tabBar, houseDetailNavitagionController]
        
        // Title TabBar
        tabBar.title = Constants.nameApp
        
        window?.rootViewController = splitViewController
        window?.makeKeyAndVisible()
        return true
        
    }
}

extension AppDelegate: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        // Change view detail in iPad
        if UIDevice.current.userInterfaceIdiom == .pad {
            // Change view detail when tab is selected
            guard let navigationController = viewController as? UINavigationController,
                let viewController = navigationController.viewControllers.first else {
                    return
            }
            let detailNavigationController: UINavigationController
            if type(of: viewController) == SeasonListViewController.self {
                detailNavigationController = seasonDetailNavigationController
            } else {
                detailNavigationController = houseDetailNavitagionController
            }
            
            splitViewController.showDetailViewController(detailNavigationController, sender: nil)
        }
        
    }
}

