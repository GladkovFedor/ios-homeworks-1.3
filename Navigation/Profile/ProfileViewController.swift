//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Федор Гладков on 26.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let cellID = "cellID"
    private let cellID2 = "cellID2"
    
    let dataStore = DataStore()
    
    let tableView: UITableView = {
        
        let tv = UITableView()
            tv.translatesAutoresizingMaskIntoConstraints = false
        
        return tv
        
    }()
    
    //  MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let safeLayout = view.safeAreaLayoutGuide
            
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.backgroundColor = .systemGray6
        
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "cellID")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "cellID2")
            
        addAllSubviews()
        
        NSLayoutConstraint.activate([
                
            tableView.topAnchor.constraint(equalTo: safeLayout.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor),
                
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    func addAllSubviews() {
        
        view.addSubview(tableView)
        
    }

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 1 : dataStore.posts.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if indexPath.section == 0 {

            let photoCell = tableView.dequeueReusableCell(withIdentifier: "cellID2") as! PhotosTableViewCell
            
                photoCell.photo1.image = UIImage(named: dataStore.photoGallery[0].name)
                photoCell.photo2.image = UIImage(named: dataStore.photoGallery[1].name)
                photoCell.photo3.image = UIImage(named: dataStore.photoGallery[2].name)
                photoCell.photo4.image = UIImage(named: dataStore.photoGallery[3].name)

            return photoCell

        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! PostTableViewCell
            
                cell.postTitle.text = dataStore.posts[indexPath.item].author
                cell.postText.text = dataStore.posts[indexPath.item].description
                cell.likes.text = "Likes: \(String(dataStore.posts[indexPath.item].likes))"
                cell.views.text = "Views: \(String(dataStore.posts[indexPath.item].views))"
                cell.postImage.image = UIImage(named: dataStore.posts[indexPath.item].image)
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? 220 : 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let profileHeader = ProfileHeaderView()
        
        return section == 0 ? profileHeader : nil
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            
            let vc = PhotosViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    
}
