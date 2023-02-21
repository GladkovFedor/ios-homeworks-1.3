//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Федор Гладков on 09.12.2022.
//

import Foundation
import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let reusableID = "photoCell"
    
    let photo: UIImageView = {
        
        let photo = UIImageView()
            photo.image = UIImage()
            photo.contentMode = .scaleAspectFill
            photo.clipsToBounds = true
        
            photo.translatesAutoresizingMaskIntoConstraints = false
        
        return photo
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemGray
        
        contentView.addSubview(photo)
        
        NSLayoutConstraint.activate([
        
            photo.topAnchor.constraint(equalTo: topAnchor),
            photo.bottomAnchor.constraint(equalTo: bottomAnchor),
            photo.leadingAnchor.constraint(equalTo: leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
