//
//  UIViewController+Navigation.swift
//  Westeros
//
//  Created by Fco_Javier_Rodriguez on 30/9/18.
//  Copyright © 2018 Fco_Javier_Rodriguez. All rights reserved.
//


import UIKit

extension UIViewController {
    
    func wrappedInNavigation() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}
