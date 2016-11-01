//
//  RoundsCell.swift
//  alamoTest
//
//  Created by David Solano Ruiz on 15/8/16.
//  Copyright © 2016 David Solano Ruiz. All rights reserved.
//
import UIKit

class rCell: UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        print("cell")
    }
    var round: Round? {
        didSet{
            titleLabel.text = round?.title
            thumbnailUserView.image = round?.profileImage
        }
    }

    let thumbnailImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        return imageView
    }()
    let thumbnailUserView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .blue
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()
    let titleLabel:UILabel = {
        let label = UILabel()
        return label
    }()

    func setupViews(){
        addSubview(thumbnailImageView)
        addSubview(thumbnailUserView)
        addSubview(titleLabel)
        
        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: thumbnailImageView )
        addConstraintsWithFormat("H:|-16-[v0(44)]-8-[v1]-16-|", views: thumbnailUserView, titleLabel)
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        
        addConstraintsWithFormat("V:|-16-[v0]-6-[v1(44)]-16-|", views: thumbnailImageView,thumbnailUserView )
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

