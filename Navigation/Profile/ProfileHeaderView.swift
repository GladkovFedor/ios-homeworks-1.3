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

        self.addSubview(profilePhoto)
        self.addSubview(fullNameLabel)
        self.addSubview(showStatusButton)
        self.addSubview(status)
        self.addSubview(rectForTextField)
            rectForTextField.addSubview(statusTextField)
            rectForTextField.clipsToBounds = true
        
    }
    
    private var statusText: String!
    
//        Фото профиля
    
    let profilePhoto: UIView = {
        
        let profilePhoto = UIView(frame: CGRect(x: 16, y: 75, width: 130, height: 130))
        
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 130, height: 130))
            image.image = UIImage(named: "hipster cat")
        
        profilePhoto.addSubview(image)
        
            profilePhoto.clipsToBounds = true
            
            profilePhoto.layer.cornerRadius = profilePhoto.frame.width / 2
            profilePhoto.layer.borderWidth = 3
            profilePhoto.layer.borderColor = UIColor.white.cgColor
        
        return profilePhoto
    }()
    
//        Имя профиля
    
    var fullNameLabel: UILabel = {
        
        let profileName = UILabel(frame: CGRect(x: 16, y: 86, width: 1, height: 1))
        
            profileName.text = "Hipster Cat"
            profileName.font = UIFont.boldSystemFont(ofSize: 18)
            profileName.textColor = .black
            profileName.center = CGPoint(x: 130 + 32, y: 86)
            profileName.textAlignment = .center

            profileName.sizeToFit()
        
        return profileName
    }()
    
//        Статус
    
    var status: UILabel = {
        
        let status = UILabel(frame: CGRect(x: 16, y: 100, width: 1, height: 1))
        
            status.textColor = .gray
            status.font = UIFont.systemFont(ofSize: 14)
            status.center = CGPoint(x: 130 + 32, y: 170)
            status.textAlignment = .left
            status.text = "Waiting for something..."

            status.sizeToFit()

        return status
    }()
    
//        Кнопока "Показать статус"
    
    var showStatusButton: UIButton = {
        
        let showStatusButton = UIButton(frame: CGRect(x: 16, y: 245, width: UIScreen.main.bounds.width - 32, height: 50))
        
            showStatusButton.backgroundColor = .systemBlue
            showStatusButton.setTitle("Set status", for: UIControl.State.normal)
            
            showStatusButton.layer.cornerRadius = 4
            showStatusButton.layer.shadowOpacity = 0.7
            showStatusButton.layer.shadowRadius = 4
            showStatusButton.layer.shadowOffset.width = 4
            showStatusButton.layer.shadowOffset.height = 4
            showStatusButton.layer.shadowColor = UIColor.black.cgColor
    
            showStatusButton.addTarget(self, action: #selector(statusButtonTapped), for: .touchUpInside)
    
        return showStatusButton
    }()
    
//        Поле ввода статуса
    
    var rectForTextField: UIView = {
        
        let rect = UIView(frame: CGRect(x: 130 + 32, y: 190, width: UIScreen.main.bounds.width - 130 - 48, height: 40))
        
            rect.backgroundColor = .white
            rect.layer.cornerRadius = 12
            rect.layer.borderWidth = 1
            rect.layer.borderColor = UIColor.black.cgColor
        
        return rect
    }()
    
    var statusTextField: UITextField = {

        let statusTextField = UITextField(frame: CGRect(x: 5, y: 0, width: UIScreen.main.bounds.width - 130 - 48 - 2, height: 40))
        
            statusTextField.backgroundColor = .white
        
            statusTextField.placeholder = "Enter your status"
            statusTextField.textColor = .black
            statusTextField.font = UIFont.systemFont(ofSize: 15)
            statusTextField.textAlignment = .left
        
            statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        return statusTextField
    }()
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func statusButtonTapped(_ sender: UIButton) {
        
        status.text = statusText
        statusTextField.text = ""
        
        if let text = status.text {
            print(text)
        }
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        
        statusTextField.clearButtonMode = .whileEditing
        statusText = textField.text
        
    }
    
}
