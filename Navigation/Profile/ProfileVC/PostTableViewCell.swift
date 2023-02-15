//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Федор Гладков on 01.12.2022.
//

import Foundation
import UIKit

class PostTableViewCell: UITableViewCell {
    
    //  MARK: - Индекс выбранной ячейки (для метода с изменением количества лайков)
    
    var indexOfSelectedCell: Int = 0
    
    //  MARK: - StackView для ячейки
    
    let stackView: UIStackView = {
        
        let sv = UIStackView()
            sv.axis = .vertical
            sv.distribution = .equalCentering
        
            sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()
    
    //  MARK: - Post Title
    
    let postTitle: UILabel = {
        
        let label = UILabel()
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            label.numberOfLines = 2
        
            label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
        
    //  MARK: - Post image
    
    let postImage: UIImageView = {
        
        let image = UIImageView()
            image.backgroundColor = .black
            image.contentMode = .scaleAspectFit
        
            image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
        
    //  MARK: - Post text
    
    let postText: UILabel = {
        
        let text = UILabel()
            text.textColor = .systemGray
            text.font = UIFont.systemFont(ofSize: 14)
            text.numberOfLines = 0
            
            text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
        
    //  MARK: - Likes and views stackView
    
    let likesAndViewsStack: UIStackView = {
        
        let sv = UIStackView()
            sv.axis = .horizontal
            sv.distribution = .fillEqually
            sv.alignment = .center

            sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()
        
    //  MARK: - Likes
    
    var likes: UILabel = {
        
        let likes = UILabel()
            likes.textColor = .black
            likes.font = UIFont.systemFont(ofSize: 16)
            likes.textAlignment = .left
            likes.isUserInteractionEnabled = true
            
            likes.translatesAutoresizingMaskIntoConstraints = false
            
        return likes
    }()
    
    //  MARK: - Views
    
    let views: UILabel = {
        
        let views = UILabel()
            views.textColor = .black
            views.font = UIFont.systemFont(ofSize: 16)
            views.textAlignment = .right
                    
            views.translatesAutoresizingMaskIntoConstraints = false
            
        return views
    }()
        
    //  MARK: - Initializers
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.addAllSubviews()
        
        setupGestureRecognizers()
        
        NSLayoutConstraint.activate([
                
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
                
            postTitle.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 16),
            postTitle.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -16),
            postTitle.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 16),
            postTitle.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -32),

            postImage.topAnchor.constraint(equalTo: postTitle.bottomAnchor, constant: 12),
            postImage.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            postImage.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor),
                
            postText.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 16),
            postText.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -16),
            postText.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
            postText.heightAnchor.constraint(equalToConstant: 50),
            
            likesAndViewsStack.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 16),
            likesAndViewsStack.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -16),
            likesAndViewsStack.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 0),
            likesAndViewsStack.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),

            likes.leadingAnchor.constraint(equalTo: likesAndViewsStack.leadingAnchor),
            likes.topAnchor.constraint(equalTo: likesAndViewsStack.topAnchor, constant: 16),
            
            views.trailingAnchor.constraint(equalTo: likesAndViewsStack.trailingAnchor),
            views.bottomAnchor.constraint(equalTo: likesAndViewsStack.bottomAnchor, constant: -16),
        ])
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    //  MARK: - Functions
        
    func addAllSubviews() {
        
        self.contentView.addSubview(stackView)
        stackView.addArrangedSubview(postTitle)
        stackView.addArrangedSubview(postImage)
        stackView.addArrangedSubview(postText)
        stackView.addArrangedSubview(likesAndViewsStack)
        likesAndViewsStack.addArrangedSubview(likes)
        
        likesAndViewsStack.addArrangedSubview(views)
     
    }
    
    private func setupGestureRecognizers() {
        
        let likesTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(likesTapped))
            likesTapRecognizer.numberOfTapsRequired = 1
            likes.addGestureRecognizer(likesTapRecognizer)
    }
    
    @objc private func likesTapped(_ sender: UITapGestureRecognizer) {
        
        DataStore.shared.posts[indexOfSelectedCell].likes += 1
        likes.text = "Likes: \(DataStore.shared.posts[indexOfSelectedCell].likes)"
        layoutIfNeeded()
    }
    
    func setUpCell(index: Int) {
        
        indexOfSelectedCell = index
        
        postTitle.text = DataStore.shared.posts[index].author
        postText.text = DataStore.shared.posts[index].description
        postImage.image = UIImage(named: DataStore.shared.posts[index].image)
        likes.text = "Likes: \(DataStore.shared.posts[index].likes)"
        views.text = "Views: \(DataStore.shared.posts[index].views)"
    }
}
