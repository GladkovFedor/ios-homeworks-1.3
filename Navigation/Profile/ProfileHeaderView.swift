//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Федор Гладков on 11.11.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView, UITextFieldDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(avatarImageView)
        self.addSubview(fullNameLabel)
        self.addSubview(statusLabel)
        self.addSubview(rectForTextField)
            rectForTextField.addSubview(statusTextField)
            rectForTextField.clipsToBounds = true
        self.addSubview(setStatusButton)
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        rectForTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 130),
            avatarImageView.widthAnchor.constraint(equalToConstant: 130),
        
            fullNameLabel.heightAnchor.constraint(equalToConstant: 20),
            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 60),
            
            rectForTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16),
            rectForTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor, constant: 0),
            rectForTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            rectForTextField.heightAnchor.constraint(equalToConstant: 50),
            
            statusTextField.topAnchor.constraint(equalTo: rectForTextField.topAnchor, constant: 0),
            statusTextField.leadingAnchor.constraint(equalTo: rectForTextField.leadingAnchor, constant: 5),
            statusTextField.trailingAnchor.constraint(equalTo: rectForTextField.trailingAnchor, constant: -5),
            statusTextField.heightAnchor.constraint(equalTo: rectForTextField.heightAnchor, constant: 0),
            
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
    }
    
    private var statusText: String!
    
    
//     MARK: - Фото профиля
    
    let avatarImageView: UIView = {
        
        let photoWidth = 130
        let photoHeight = 130
        
        let profilePhoto = UIView()
        
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: photoWidth, height: photoHeight))
            image.image = UIImage(named: "hipster cat")
        
        profilePhoto.addSubview(image)
        
            profilePhoto.layer.cornerRadius = CGFloat(photoWidth) / 2
            profilePhoto.layer.borderWidth = 3
            profilePhoto.layer.borderColor = UIColor.white.cgColor
        
        profilePhoto.clipsToBounds = true
        
        return profilePhoto
    }()
    
//     MARK: - Имя профиля
    
    var fullNameLabel: UILabel = {
        
        let profileName = UILabel()
        
            profileName.text = "Hipster Cat"
            profileName.font = UIFont.boldSystemFont(ofSize: 18)
            profileName.textColor = .black
            profileName.sizeToFit()
        
        return profileName
    }()
    
//     MARK: -    Статус
    
    var statusLabel: UILabel = {
        
        var status = UILabel()
        
            status.textColor = .gray
            status.font = UIFont.systemFont(ofSize: 14)
            status.textAlignment = .left
            status.text = "Waiting for something..."
            status.sizeToFit()

        return status
    }()
    
//     MARK: - Кнопока "Показать статус"
    
    var setStatusButton: UIButton = {
        
        let btn = UIButton()
        
            btn.backgroundColor = .systemBlue
            btn.setTitle("Set status", for: .normal)
                
            btn.layer.cornerRadius = 4
            btn.layer.shadowOpacity = 0.7
            btn.layer.shadowRadius = 4
            btn.layer.shadowOffset.width = 4
            btn.layer.shadowOffset.height = 4
            btn.layer.shadowColor = UIColor.black.cgColor
        
            btn.addTarget(self, action: #selector(setStatusButtonTapped), for: .touchUpInside)
        
        return btn
    }()
    
//     MARK: - Поле ввода статуса
    
    var rectForTextField: UIView = {
        
        let rect = UIView()
        
            rect.backgroundColor = .white
            rect.layer.cornerRadius = 12
            rect.layer.borderWidth = 1
            rect.layer.borderColor = UIColor.black.cgColor
        
        return rect
    }()
    
    var statusTextField: UITextField = {

        let statusTextField = UITextField()
        
            statusTextField.backgroundColor = .white
        
            statusTextField.placeholder = "Enter your status"
            statusTextField.textColor = .black
            statusTextField.font = UIFont.systemFont(ofSize: 15)
            statusTextField.textAlignment = .left
        
            statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        return statusTextField
    }()
    
//      MARK: - Functions
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func setStatusButtonTapped(_ sender: UIButton) {
        
        statusLabel.text = statusText
        statusTextField.text = ""

        if let text = statusLabel.text {
            print(text)
        }
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        
        statusTextField.clearButtonMode = .whileEditing
        statusText = textField.text
        
    }
    
}
