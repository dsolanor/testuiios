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
            viewControllers = [homeController]
        }else{
            // User is not logged
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        }
    }
    fileprivate func isLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    func showLoginController(){
        let loginController = LoginScreen()
        present(loginController, animated: true, completion: {
            //On completion
        })
        
        
    }
}
