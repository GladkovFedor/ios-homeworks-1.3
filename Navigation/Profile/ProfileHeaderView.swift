//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Федор Гладков on 11.11.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView, UITextFieldDelegate {
    
    private var statusText: String!
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    
//     MARK: - Фото профиля
    
    let avatarImageView: UIView = {
        
        let profilePhoto = UIView()
            profilePhoto.layer.cornerRadius = 130 / 2
            profilePhoto.layer.borderWidth = 3
            profilePhoto.layer.borderColor = UIColor.white.cgColor
        
            profilePhoto.translatesAutoresizingMaskIntoConstraints = false
        
        return profilePhoto
    }()
    
    let image: UIImageView = {
        
        let image = UIImageView(image: UIImage(named: "hipster cat"))
        
            image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
        
    }()
    
//     MARK: - Полупрозрачная вью для анимации
    
    var alphaView: UIView = {
        
        let view = UIView()
        
            view.isHidden = true
            view.backgroundColor = .black
            view.alpha = 0
        
            view.isHidden = true
        
            view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
//     MARK: - Кнопка закрытия открытой фотографии профиля
    
    var closeButton: UIButton = {
       
        let btn = UIButton()
            
            btn.setImage(UIImage(systemName: "xmark"), for: .normal)
            btn.tintColor = .white
            btn.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            btn.alpha = 0
        
            btn.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
            btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
        
    }()
    
//     MARK: - Имя профиля
    
    var fullNameLabel: UILabel = {
        
        let profileName = UILabel()
        
            profileName.text = "Hipster Cat"
            profileName.font = UIFont.boldSystemFont(ofSize: 18)
            profileName.textColor = .black
            profileName.sizeToFit()
        
            profileName.translatesAutoresizingMaskIntoConstraints = false
        
        return profileName
    }()
    
//     MARK: - Статус
    
    var statusLabel: UILabel = {
        
        var status = UILabel()
        
            status.textColor = .gray
            status.font = UIFont.systemFont(ofSize: 14)
            status.textAlignment = .left
            status.text = "Waiting for something..."
        
            status.sizeToFit()
            status.translatesAutoresizingMaskIntoConstraints = false

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
        
            btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
//     MARK: - Поле ввода статуса
    
    var rectForTextField: UIView = {
        
        let rect = UIView()
        
            rect.backgroundColor = .white
            rect.layer.cornerRadius = 12
            rect.layer.borderWidth = 1
            rect.layer.borderColor = UIColor.black.cgColor
        
            rect.translatesAutoresizingMaskIntoConstraints = false
        
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
        
            statusTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return statusTextField
    }()
    
//      MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemGray6

        self.addAllSubviews()
        
        tapGestureRecognizer.addTarget(self, action: #selector(profileImageTapped))
        tapGestureRecognizer.numberOfTapsRequired = 1
 
        avatarImageView.addGestureRecognizer(tapGestureRecognizer)
                
        NSLayoutConstraint.activate([
            
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 130),
            avatarImageView.widthAnchor.constraint(equalToConstant: 130),
            
            image.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            image.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            image.heightAnchor.constraint(equalTo: avatarImageView.heightAnchor),
            image.widthAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            fullNameLabel.heightAnchor.constraint(equalToConstant: 20),
            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            
            statusLabel.leadingAnchor.constraint(equalTo: rectForTextField.leadingAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: rectForTextField.topAnchor, constant: -10),
            
            rectForTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -10),
            rectForTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            rectForTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            rectForTextField.heightAnchor.constraint(equalToConstant: 40),
            
            statusTextField.topAnchor.constraint(equalTo: rectForTextField.topAnchor, constant: 0),
            statusTextField.leadingAnchor.constraint(equalTo: rectForTextField.leadingAnchor, constant: 5),
            statusTextField.trailingAnchor.constraint(equalTo: rectForTextField.trailingAnchor, constant: -5),
            statusTextField.heightAnchor.constraint(equalTo: rectForTextField.heightAnchor),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            setStatusButton.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
            alphaView.topAnchor.constraint(equalTo: topAnchor),
            alphaView.leadingAnchor.constraint(equalTo: leadingAnchor),
            alphaView.trailingAnchor.constraint(equalTo: trailingAnchor),
            alphaView.heightAnchor.constraint(equalToConstant: 1000),
            
            closeButton.trailingAnchor.constraint(equalTo: alphaView.trailingAnchor, constant: -20),
            closeButton.topAnchor.constraint(equalTo: alphaView.topAnchor, constant: 20)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//      MARK: - Functions
    
    func addAllSubviews() {
        
        self.addSubview(fullNameLabel)
        self.addSubview(statusLabel)
        self.addSubview(rectForTextField)
        rectForTextField.addSubview(statusTextField)
        rectForTextField.clipsToBounds = true
        self.addSubview(setStatusButton)
        
        self.addSubview(alphaView)
        alphaView.addSubview(closeButton)
        self.addSubview(avatarImageView)
        avatarImageView.addSubview(image)
        avatarImageView.clipsToBounds = true
        
    }

    @objc func setStatusButtonTapped(_ sender: UIButton) {
        
        statusLabel.text = statusText
        statusTextField.text = ""

    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        
        statusTextField.clearButtonMode = .whileEditing
        statusText = textField.text
        
    }
    
    @objc func profileImageTapped(_ gestureRecognizer: UITapGestureRecognizer) {
        
        print("avatar tapped")
        
        UIView.animate(withDuration: 0.5, delay: 0, animations: {
            
            let coef = UIScreen.main.bounds.width / 130
            
            self.avatarImageView.center.x = self.center.x
            self.avatarImageView.center.y = self.center.y + 200
            
            self.avatarImageView.transform = CGAffineTransform(scaleX: coef, y: coef)
            self.avatarImageView.layer.cornerRadius = 0
            
            self.alphaView.isHidden = false
            self.alphaView.alpha = 0.5
            
        })
        
        UIView.animate(withDuration: 0.3, delay: 0.5, animations: {
            
            self.closeButton.alpha = 1
            
        })
        
    }
    
    @objc func closeButtonTapped(_ sender: UIButton) {
        
        print("close btn tapped")
        
        UIView.animate(withDuration: 0.3, delay: 0, animations: {
            
            self.closeButton.alpha = 0
            
        })
        
        UIView.animate(withDuration: 0.5, delay: 0.3, animations: { [self] in
            
            self.avatarImageView.center.x = 16 + 130 / 2
            self.avatarImageView.center.y = 12 + 130 / 2
            
            self.avatarImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.avatarImageView.layer.cornerRadius = 130 / 2

            self.alphaView.alpha = 0

        })
        
    }
    
}
