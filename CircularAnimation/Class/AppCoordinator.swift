//
//  AppCoordinator.swift
//  CircularAnimation
//
//  Created by jatin verma on 07/05/21.
//

import Foundation
import UIKit

class AppCoordinator {
    private let window: UIWindow!
    
    var homeVC:HomeViewController!
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let home = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let rootNC = UINavigationController(rootViewController: home)
        self.window?.rootViewController = rootNC
        self.window?.makeKeyAndVisible()
        
    }
}
