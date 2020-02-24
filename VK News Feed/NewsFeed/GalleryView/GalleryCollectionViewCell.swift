//
//  GalleryCollectionViewCell.swift
//  VK News Feed
//
//  Created by Roman Rakhlin on 09.02.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import Foundation
import  UIKit

class GalleryCollectionViewCell: UICollectionViewCell {

    static let reuseId = "GalleryCollectionViewCell"

    let myImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = #colorLiteral(red: 0.8882605433, green: 0.8981810212, blue: 0.9109882712, alpha: 1)
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(myImageView)
        // myImageView constraints
        myImageView.fillSuperview()
    }

    override func prepareForReuse() {
        myImageView.image = nil
    }

    func set(imageUrl: String?) {
        myImageView.set(imageURL: imageUrl)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        myImageView.layer.masksToBounds = true
        myImageView.layer.cornerRadius = 10
        self.layer.shadowRadius = 3
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 2.5, height: 4)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
