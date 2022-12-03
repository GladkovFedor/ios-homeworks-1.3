//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Федор Гладков on 26.10.2022.
//

import UIKit

    private let cellID = "celID"

class ProfileViewController: UIViewController {
    
    let dataStore = DataStore()
    
    let tableView: UITableView = {
        
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        
        return tv
        
    }()
    
    //  MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        navigationController?.navigationBar.isHidden = false
        
        view.backgroundColor = .systemBackground
        
        let safeLayout = view.safeAreaLayoutGuide
            
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "cellID")
            
        addAllSubviews()
            
        NSLayoutConstraint.activate([
            
//            view.topAnchor.constraint(equalTo: safeLayout.topAnchor),
//            view.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor),
//            view.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor),
//            view.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor),
                
            tableView.topAnchor.constraint(equalTo: safeLayout.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor),
                
        ])
    }
    
    func addAllSubviews() {
        
        view.addSubview(tableView)
        
    }

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStore.posts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! PostTableViewCell
        cell.postTitle.text = dataStore.posts[indexPath.item].author
        cell.postText.text = dataStore.posts[indexPath.item].description
        cell.likes.text = "Likes: \(String(dataStore.posts[indexPath.item].likes))"
        cell.views.text = "Views: \(String(dataStore.posts[indexPath.item].views))"
        cell.postImage.image = UIImage(named: dataStore.posts[indexPath.item].image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let profileHeader = ProfileHeaderView()
        return profileHeader
        
    }
    
}
