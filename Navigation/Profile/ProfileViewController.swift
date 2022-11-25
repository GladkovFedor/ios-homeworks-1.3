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
        
        profileHeaderView = ProfileHeaderView(frame: view.frame)
        
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(profileHeaderView)
        
        var insetsLayoutMarginsFromSafeArea: Bool = true
        
//        NSLayoutConstraint.activate([
//            profileHeaderView.heightAnchor.constraint(equalToConstant: 44.0)
//        ])
        
    }
    
    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = view.frame
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
