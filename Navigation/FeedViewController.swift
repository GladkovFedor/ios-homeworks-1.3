//
//  FeedViewController.swift
//  Navigation
//
//  Created by Федор Гладков on 26.10.2022.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        let newPost = Post(title: "The newest post")
        
        let watchPostButton = UIButton()
        self.view.addSubview(watchPostButton)
        
        watchPostButton.setTitle("Watch post", for: .normal)
        watchPostButton.translatesAutoresizingMaskIntoConstraints = false
        
        watchPostButton.addAction(UIAction(handler: { _ in
            
            let vc = PostViewController()
            
            vc.titleFromPost = newPost.title
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            watchPostButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            watchPostButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            watchPostButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
