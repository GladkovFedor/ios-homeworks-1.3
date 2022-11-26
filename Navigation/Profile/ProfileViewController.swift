//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Федор Гладков on 26.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    var profileHeaderView: ProfileHeaderView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        profileHeaderView = ProfileHeaderView()
        
        let safeLayout = self.view.safeAreaLayoutGuide
        
        
        self.view.addSubview(profileHeaderView)
        self.view.addSubview(changeTitleButton)
        
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        changeTitleButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            profileHeaderView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 0),
            profileHeaderView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            changeTitleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            changeTitleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            changeTitleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            changeTitleButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
    }

    let changeTitleButton: UIButton = {

        let btn = UIButton()
            btn.backgroundColor = .systemBlue
            btn.addTarget(self, action: #selector(changeTitleButtonPressed), for: .touchUpInside)
            btn.backgroundColor = .systemBlue
            btn.setTitle("Change title", for: .normal)

        return btn
        
    }()
    
    @objc func changeTitleButtonPressed(_ sender: UIButton) {
        print("Hi")
    }
    
}
