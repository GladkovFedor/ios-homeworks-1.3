//
//  FeedViewController.swift
//  Navigation
//
//  Created by Федор Гладков on 26.10.2022.
//

import UIKit

class FeedViewController: UIViewController {

    let newPost = Post(title: "The newest post")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        self.view.addSubview(stackViewButtons)
        stackViewButtons.translatesAutoresizingMaskIntoConstraints = false
        
        stackViewButtons.addArrangedSubview(button1)
        stackViewButtons.addArrangedSubview(button2)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            
            stackViewButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewButtons.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackViewButtons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackViewButtons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            stackViewButtons.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
//            stackViewButtons.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 16)

        ])
        
    }
    
//      MARK: - Stack View
    
    let stackViewButtons: UIStackView = {
        
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        
        return stack
        
    }()
    
        let button1: UIButton = {
            
            let btn = UIButton()
            btn.backgroundColor = .red
            btn.setTitle("Button 1", for: .normal)
            
            btn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
            
            return btn
            
        }()
        
        let button2: UIButton = {
            
            let btn = UIButton()
            btn.backgroundColor = .blue
            btn.setTitle("Button 2", for: .normal)
            
            btn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
            
            return btn
            
        }()
    
    
    
    @objc func btnTapped(_ handler: UIButton) {
        
        let vc = PostViewController()
        vc.titleFromPost = newPost.title
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
