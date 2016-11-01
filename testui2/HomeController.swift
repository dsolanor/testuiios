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

class HomeController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var myRounds: [Round]?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.myRounds = [Round]()
        
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign out", style: .plain, target: self, action: #selector(handleLogout))
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let myCollectionView:UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(rCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView.backgroundColor = .white
        view.addSubview(myCollectionView)
        
        
        
//        let retrievedToken: String? = KeychainWrapper.standard.string(forKey: "token")
        

        let UDToken = UserDefaults.standard.string(forKey: "UDToken")
        let alertError: UIAlertController = {
            let alert = UIAlertController()
            alert.title = "Error"
            alert.message = "error message"
            return alert
        }()
        
        
        Alamofire.request("https://randomuser.me/api/?results=5").responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json["results"][0]["phone"])")
                
                if let items = json["results"].array {
                    for item in items {
                        let round = Round()
                        if var title = item["name"]["first"].string {
                            title = title.capitalized
                            round.title = "Uploaded by \(title)"
                        }
                        if let imageURL = item["picture"]["medium"].string {
                            let imageURLtoString = NSURL(string: imageURL)
                            let imageData = NSData(contentsOf: imageURLtoString as! URL)
                            round.profileImage = UIImage(data: imageData as! Data)
                        }
                        
                        //            self.myRounds?.append(round)
                        self.myRounds?.insert(round, at: 0)
                    }
                }
                myCollectionView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    func handleLogout(){
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        UserDefaults.standard.synchronize()
        
        let loginController = LoginScreen()
        present(loginController, animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myRounds?.count ?? 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! rCell
        myCell.round = myRounds?[(indexPath as NSIndexPath).item]
        myCell.backgroundColor = .yellow
        return myCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
}
extension UIView{
    func addConstraintsWithFormat(_ format:String, views:UIView...){
        var viewsDictionary = [String:UIView]()
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
