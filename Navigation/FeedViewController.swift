//
//  FeedViewController.swift
//  Navigation
//
//  Created by Федор Гладков on 26.10.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    let newPost = Post(author: "", description: "", image: "", likes: 0, views: 0)
    
    //      MARK: - Stack View
    
    let stackViewButtons: UIStackView = {
        
        let sv = UIStackView()
            sv.axis = .vertical
            sv.alignment = .fill
            sv.distribution = .fillEqually
            sv.spacing = 10
                
            sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()
    
    let button1: UIButton = {
        
        let btn = UIButton()
            btn.backgroundColor = .red
            btn.setTitle("Button 1", for: .normal)
            btn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        
            btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    let button2: UIButton = {
        
        let btn = UIButton()
            btn.backgroundColor = .blue
            btn.setTitle("Button 2", for: .normal)
            btn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
            
            btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        
        self.view.addSubview(stackViewButtons)
        stackViewButtons.addArrangedSubview(button1)
        stackViewButtons.addArrangedSubview(button2)
        
        NSLayoutConstraint.activate([
            
            stackViewButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewButtons.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackViewButtons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackViewButtons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

        ])
        
    }
    
    @objc func btnTapped(_ handler: UIButton) {
        let vc = PostViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
