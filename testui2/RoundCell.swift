//
//  RoundsCell.swift
//  alamoTest
//
//  Created by David Solano Ruiz on 15/8/16.
//  Copyright © 2016 David Solano Ruiz. All rights reserved.
//
import UIKit

class RoundCell: UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        print("cell")
    }
    
    
//    var round: Round? {
//        didSet{
//            titleLabel.text = round?.title
//        }
//    }
    
    
    let thumbnailImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.gray
        return imageView
    }()
    let titleLabel:UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    func setupViews(){
        //        backgroundColor = UIColor.redColor()
        
        addSubview(thumbnailImageView)
        addSubview(titleLabel)
        
//        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: thumbnailImageView )
//        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: titleLabel)
//        addConstraintsWithFormat("V:|-16-[v0]-6-[v1(44)]|", views: thumbnailImageView,titleLabel )
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//extension UIView{
//    func addConstraintsWithFormat(_ format:String, views:UIView...){
//        var viewsDictionary = [String:UIView]()
//        for (index, view) in views.enumerated(){
//            let key = "v\(index)"
//            view.translatesAutoresizingMaskIntoConstraints = false
//            viewsDictionary[key] = view
//        }
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
//    }
//}
