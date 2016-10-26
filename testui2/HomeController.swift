//
//  HomeController.swift
//  testui2
//
//  Created by David Solano Ruiz on 25/10/16.
//  Copyright © 2016 David Solano. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        print("init home")
        Alamofire.request("https://randomuser.me/api/").responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json["results"][0]["phone"])")
            case .failure(let error):
                print(error)
            }
        }
    }
}
