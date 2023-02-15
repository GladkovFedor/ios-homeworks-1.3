//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Федор Гладков on 09.12.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
//    let dataStore = DataStore()
    
    var alphaView: UIView = {
        
        let view = UIView()
            view.backgroundColor = .black
            view.alpha = 0.5
            view.isHidden = true
        
            view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var enlargedImage: UIImageView = {
    
        let view = UIImageView()
            view.alpha = 0

            view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var closeButton: UIButton = {
       
        let btn = UIButton()
            btn.setImage(UIImage(systemName: "xmark"), for: .normal)
            btn.tintColor = .white
            btn.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            btn.alpha = 1
        
            btn.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
            btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Photo Gallery"

        view.backgroundColor = .systemGray6
        
        let screenSize = UIScreen.main.bounds
        let safeLayout = self.view.safeAreaLayoutGuide
        let layout = UICollectionViewFlowLayout()

        let photosCollectionView = UICollectionView(frame: CGRect(x: 8, y: 0, width: screenSize.width - 16, height: screenSize.height), collectionViewLayout: layout)

        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self

        photosCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.reusableID)

        view.addSubview(photosCollectionView)
        addAllSubviews()
        
        NSLayoutConstraint.activate([
            
            alphaView.topAnchor.constraint(equalTo: safeLayout.topAnchor),
            alphaView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor),
            alphaView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor),
            alphaView.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor),
            
            enlargedImage.centerYAnchor.constraint(equalTo: alphaView.centerYAnchor),
            enlargedImage.centerXAnchor.constraint(equalTo: alphaView.centerXAnchor),
            
            closeButton.trailingAnchor.constraint(equalTo: alphaView.trailingAnchor, constant: -15),
            closeButton.topAnchor.constraint(equalTo: alphaView.topAnchor, constant: 15)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    func addAllSubviews() {
        view.addSubview(alphaView)
        alphaView.addSubview(closeButton)
        view.addSubview(enlargedImage)
        enlargedImage.clipsToBounds = true
    }
    
    @objc func closeButtonTapped() {
        
        print("close btn tapped")
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
            self.closeButton.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: 1, delay: 0) {
                self.alphaView.alpha = 0
                self.enlargedImage.alpha = 0
            }
        }
    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        DataStore.shared.photoGallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.reusableID, for: indexPath) as! PhotosCollectionViewCell
            cell.backgroundColor = .clear
            cell.photo.image = UIImage(named: DataStore.shared.photoGallery[indexPath.item].name)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let screenSize = UIScreen.main.bounds
        let width = (screenSize.width - 32) / 3

        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("Selected \(DataStore.shared.photoGallery[indexPath.item].name)")
        
        let tappedImage = UIImage(named: DataStore.shared.photoGallery[indexPath.item].name)
        let screenSize = UIScreen.main.bounds
        let scaleFactor = screenSize.width / tappedImage!.size.width
        
        self.enlargedImage.image = tappedImage
        self.enlargedImage.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
      
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut) {
                  
            self.enlargedImage.alpha = 1
            self.alphaView.isHidden = false
            self.alphaView.alpha = 0.6
      
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0) {
                self.closeButton.alpha = 1
            }
        }
    }
}
