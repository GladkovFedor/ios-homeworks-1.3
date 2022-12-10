//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Федор Гладков on 09.12.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    let collectionView = PhotosCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Photo Gallery"
        
        view.backgroundColor = .white
        
        let safeLayout = self.view.safeAreaLayoutGuide
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(collectionView)
        
        

        NSLayoutConstraint.activate([
        
            collectionView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 8),
            collectionView.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor, constant: -8),
            collectionView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: -8),
        
        ])
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.isHidden = false
        
    }
    
}
