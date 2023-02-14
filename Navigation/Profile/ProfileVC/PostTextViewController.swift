//
//  PostTextViewController.swift
//  Navigation
//
//  Created by Федор Гладков on 11.02.2023.
//

import UIKit

class PostTextViewController: UIViewController {
    
    let headline: UILabel = {
        
        let label = UILabel()
        
            label.text = "Headline"
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            label.numberOfLines = 0
            
            label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    let postText: UITextView = {
        
        let tv = UITextView()
        
            tv.text = "jvksdnvljd knsvlkfdnvlskn vsnlvknosinvis nsdkijvnsjuhoi vsndlvnsvlsknvsdk jklsnd"
            tv.textColor = .black
            tv.font = UIFont.systemFont(ofSize: 20)
            tv.backgroundColor = .systemGray6
                
            tv.translatesAutoresizingMaskIntoConstraints = false
        
        return tv
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        
        let safeLayout = view.safeAreaLayoutGuide
        
        addAllSubviews()
        
        NSLayoutConstraint.activate([
        
            headline.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 16),
            headline.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 16),
            headline.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: -16),
            
            postText.topAnchor.constraint(equalTo: headline.bottomAnchor, constant: 10),
            postText.leadingAnchor.constraint(equalTo: headline.leadingAnchor, constant: -4),
            postText.trailingAnchor.constraint(equalTo: headline.trailingAnchor),
            postText.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor, constant: -16)
        ])
    }
    
    func addAllSubviews() {
        
        view.addSubview(headline)
        headline.sizeToFit()
        view.addSubview(postText)
        postText.sizeToFit()
        
    }
}
