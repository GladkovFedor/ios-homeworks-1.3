//
//  PostViewController.swift
//  Navigation
//
//  Created by Федор Гладков on 26.10.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var titleFromPost: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        title = titleFromPost
        
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(infoButtonTapped))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func infoButtonTapped(_ sender: UIBarButtonItem) {
        let infoVC = InfoViewController()
        present(infoVC, animated: true)
    }
}
