//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Федор Гладков on 26.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    var profileHeaderView: ProfileHeaderView = {
        
        let vc = ProfileHeaderView()
            vc.translatesAutoresizingMaskIntoConstraints = false
        
        return vc
        
    }()
    
    let changeTitleButton: UIButton = {

        let btn = UIButton()
            btn.backgroundColor = .systemBlue
            btn.addTarget(self, action: #selector(changeTitleButtonPressed), for: .touchUpInside)
            btn.backgroundColor = .systemBlue
            btn.setTitle("Change title", for: .normal)
        
            btn.translatesAutoresizingMaskIntoConstraints = false

        return btn
        
    }()
    
    //      MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let safeLayout = self.view.safeAreaLayoutGuide
        
        view.backgroundColor = .lightGray
        
        self.addAllSubviews()
        
        
        
        NSLayoutConstraint.activate([
            
            profileHeaderView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 0),
            profileHeaderView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 0),
            
            changeTitleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            changeTitleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            changeTitleButton.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor, constant: 0),
            changeTitleButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    func addAllSubviews() {
        
        profileHeaderView = ProfileHeaderView()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(profileHeaderView)
        self.view.addSubview(changeTitleButton)
        
    }
    
    @objc func changeTitleButtonPressed(_ sender: UIButton) {
        print("Hi")
    }
    
}
