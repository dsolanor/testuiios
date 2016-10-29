//
//  ViewController.swift
//  testui2
//
//  Created by David Solano on 24/10/16.
//  Copyright © 2016 David Solano. All rights reserved.
//

import UIKit

class MainNavController: UINavigationController {
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        if isLoggedIn() {
            // User is logged in
            let homeController = HomeController()
//            let feedLayout = UICollectionViewFlowLayout()
//            let feedController = FeedController(collectionViewLayout: feedLayout)
            viewControllers = [homeController]
        }else{
            // User is not logged
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        }
    }
    fileprivate func isLoggedIn() -> Bool {
        return true
    }
    func showLoginController(){
        let loginController = LoginScreen()
        present(loginController, animated: true, completion: {
            //On completion
        })
        
        
    }
}
