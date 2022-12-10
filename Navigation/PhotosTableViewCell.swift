//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Федор Гладков on 05.12.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    let title: UILabel = {
        
        let label = UILabel()
        
            label.text = "Photos"
            label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            label.textColor = .black
            
            label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    let arrow: UIImageView = {
        
        let image = UIImageView(image: UIImage(systemName: "arrow.forward"))
            image.tintColor = .black
        
            image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
        
    }()
    
    let stackView: UIStackView = {
        
        let sv = UIStackView()
        
            sv.axis = .horizontal
            sv.distribution = .fillEqually
            sv.spacing = 8
        
            sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()
    
    let photo1: UIImageView = {
        
        let image = UIImageView()
        
            image.backgroundColor = .red
            image.layer.cornerRadius = 6
            image.contentMode = .scaleAspectFill
            image.clipsToBounds = true
            image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
        
    }()
    
    let photo2: UIImageView = {
        
        let image = UIImageView()
        
        image.backgroundColor = .red
        image.layer.cornerRadius = 6
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
        
    }()
    
    let photo3: UIImageView = {
        
        let image = UIImageView()
        
        image.backgroundColor = .red
        image.layer.cornerRadius = 6
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
        
    }()
    
    let photo4: UIImageView = {
        
        let image = UIImageView()
        
        image.backgroundColor = .red
        image.layer.cornerRadius = 6
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
        
    }()
    
    
    //  MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.addAllSubviews()
            
        NSLayoutConstraint.activate([
                
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            
            arrow.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            arrow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            stackView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            stackView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48)/3 - 24),

        ])
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    //  MARK: - Functions
        
    func addAllSubviews() {
            
        self.addSubview(title)
        self.addSubview(arrow)
        
//        self.addSubview(photos)
//
        
        self.addSubview(stackView)
        stackView.addArrangedSubview(photo1)
        stackView.addArrangedSubview(photo2)
        stackView.addArrangedSubview(photo3)
        stackView.addArrangedSubview(photo4)
       
    }

}
