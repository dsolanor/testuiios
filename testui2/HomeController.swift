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
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let myCollectionView:UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(rCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView.backgroundColor = .white
        view.addSubview(myCollectionView)

        
        Alamofire.request("https://randomuser.me/api/?results=5").responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json["results"][0]["phone"])")
                
                if let items = json["results"].array {
                    for item in items {
                        let round = Round()
                        if let title = item["name"]["first"].string {
                            round.title = title
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
    class rCell: UICollectionViewCell{
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
            print("cell")
        }
        var round: Round? {
            didSet{
                titleLabel.text = round?.title
            }
        }
        
        let thumbnailImageView:UIImageView = {
            let imageView = UIImageView()
            imageView.backgroundColor = UIColor.gray
            return imageView
        }()
        let titleLabel:UILabel = {
            let label = UILabel()
            label.text = "test Title"
            return label
        }()
        
        func setupViews(){
            addSubview(thumbnailImageView)
            addSubview(titleLabel)
            
            addConstraintsWithFormat("H:|-16-[v0]-16-|", views: thumbnailImageView )
            addConstraintsWithFormat("H:|-16-[v0]-16-|", views: titleLabel)
            addConstraintsWithFormat("V:|-16-[v0]-6-[v1(44)]|", views: thumbnailImageView,titleLabel )
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myRounds?.count ?? 5;
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






//class FeedController: UICollectionViewController {
//
//    var myRounds: [Round]?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .red
//
//        self.myRounds = [Round]()
//        let round = Round()
//        round.title = "test title"
//        self.myRounds?.insert(round, at: 0)
//        self.collectionView?.reloadData()
//    }
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        
//        return myRounds?.count ?? 0;
//    }
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! RoundCell
//        cell.round = myRounds?[(indexPath as NSIndexPath).item]
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
//        
//        return CGSize(width: view.frame.width, height: 300)
//    }
//
//}
