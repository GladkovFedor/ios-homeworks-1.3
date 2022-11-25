//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Федор Гладков on 11.11.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView, UITextFieldDelegate {
    
    var profilePhoto: UIView!
    var profileName: UILabel!
    var status: UILabel!
    var showStatusButton: UIButton!
    var statusTextField: UITextField!
    
    private var statusText: String!
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        
//        Фото профиля
        
        profilePhoto = UIView(frame: CGRect(x: 16, y: 75, width: 130, height: 130))
        
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 130, height: 130))
            image.image = UIImage(named: "hipster cat")
        
        profilePhoto.addSubview(image)
        
            profilePhoto.clipsToBounds = true
            
            profilePhoto.layer.cornerRadius = profilePhoto.frame.width / 2
            profilePhoto.layer.borderWidth = 3
            profilePhoto.layer.borderColor = UIColor.white.cgColor
            
        self.addSubview(profilePhoto)
        
        
//        Имя профиля
        
        profileName = UILabel(frame: CGRect(x: 16, y: 86, width: 1, height: 1))
        
            profileName.text = "Hipster Cat"
            profileName.font = UIFont.boldSystemFont(ofSize: 18)
            profileName.textColor = .black
            profileName.center = CGPoint(x: profilePhoto.frame.width + 32, y: 86)
            profileName.textAlignment = .center

            profileName.sizeToFit()

        self.addSubview(profileName)
        
        
//        Кнопока "Показать статус"
        
        showStatusButton = UIButton(frame: CGRect(x: 16, y: 245, width: frame.width - 32, height: 50))
        
            showStatusButton.backgroundColor = .systemBlue
            showStatusButton.setTitle("Set status", for: UIControl.State.normal)
            
            showStatusButton.layer.cornerRadius = 4
            
            showStatusButton.layer.shadowOpacity = 0.7
            showStatusButton.layer.shadowRadius = 4
            showStatusButton.layer.shadowOffset.width = 4
            showStatusButton.layer.shadowOffset.height = 4
            showStatusButton.layer.shadowColor = UIColor.black.cgColor
        
        showStatusButton.addTarget(self, action: #selector(statusButtonTapped(_:)), for: .touchUpInside)
        
        self.addSubview(showStatusButton)
        
        
        
//        Статус
        
        status = UILabel(frame: CGRect(x: 16, y: 100, width: 1, height: 1))
        
            status.textColor = .gray
            status.font = UIFont.systemFont(ofSize: 14)
            status.center = CGPoint(x: profilePhoto.frame.width + 32, y: 170)
            status.textAlignment = .left
            status.text = "Waiting for something..."

            status.sizeToFit()

        self.addSubview(status)
        
        
        
//        Поле ввода статуса
        
//        Для text field пришлость добавить корневой view rect, для того чтобы мигающий курсор не совпадал с рамкой
        
        let rect = UIView(frame: CGRect(x: profilePhoto.frame.width + 32, y: 190, width: frame.width - profilePhoto.frame.width - 48, height: 40))
        
            rect.backgroundColor = .white
            rect.layer.cornerRadius = 12
            rect.layer.borderWidth = 1
            rect.layer.borderColor = UIColor.black.cgColor
        
        statusTextField = UITextField(frame: CGRect(x: 5, y: 0, width: rect.frame.width - 2, height: rect.frame.height))
        
            statusTextField.backgroundColor = .white
            
            statusTextField.placeholder = "Enter your status"
            statusTextField.textColor = .black
            statusTextField.font = UIFont.systemFont(ofSize: 15)
            statusTextField.textAlignment = .left
        
            statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        rect.addSubview(statusTextField)
        rect.clipsToBounds = true
        self.addSubview(rect)
    
    }

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
