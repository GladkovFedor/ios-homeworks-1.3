//
//  PhotosCollectionView.swift
//  Navigation
//
//  Created by Федор Гладков on 09.12.2022.
//

import UIKit

class PhotosCollectionView: UICollectionView {
    
    let dataStore = DataStore()
    
    let alphaView: UIView = {
        
        let view = UIView()
            view.backgroundColor = .red
            view.alpha = 0.7
        
            view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    init() {
        
        let layout = UICollectionViewFlowLayout()
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        dataSource = self
        delegate = self
        
        register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.reusableID)
        
        addAllSubviews()
        
        NSLayoutConstraint.activate([
                
            alphaView.topAnchor.constraint(equalTo: self.topAnchor),
            alphaView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            alphaView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            alphaView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
                
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addAllSubviews() {
        
        self.addSubview(alphaView)
        
    }
}

extension PhotosCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.reusableID, for: indexPath) as! PhotosCollectionViewCell
            cell.backgroundColor = .clear
            cell.photo.image = UIImage(named: dataStore.photoGallery[indexPath.item].name)
        
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
//        collectionView.deselectItem(at: indexPath, animated: true)

        print("selected \(indexPath)")

        let selectedCell = collectionView.cellForItem(at: indexPath)

        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut) {

            selectedCell?.center.x = (UIScreen.main.bounds.width / 2) - 8
            selectedCell?.center.y = (UIScreen.main.bounds.height / 2)
//            selectedCell?.layer.position = CGPoint(x: (UIScreen.main.bounds.width / 2) - 8, y: (UIScreen.main.bounds.height / 2) - 108)
            selectedCell?.transform = CGAffineTransform(scaleX: 3, y: 3)
            
//            (UIScreen.main.bounds.height / 2) - 100
//            selectedCell
//            selectedCell?.contentView.subviews[0]
//            selectedCell?.contentView.center.y = screenSize!.height / 2

//            selectedCell?.contentView.center.y =

//            self.layoutIfNeeded()

        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0) {
//                self.closeButton.alpha = 1
            }
        }
    }
}
