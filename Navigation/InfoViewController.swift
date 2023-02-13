//
//  InfoViewController.swift
//  Navigation
//
//  Created by Федор Гладков on 26.10.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        let alertButton = UIButton()
        self.view.addSubview(alertButton)
        
        alertButton.setTitle("Tap to show alert message!", for: .normal)
        alertButton.setTitleColor(.black, for: .normal)
        
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        func alertButtonTapped() {
            
            let alertController = UIAlertController(title: "Title of alert message!", message: "Alert message itself!", preferredStyle: .alert)
            let firstAlertAction = UIAlertAction(title: "Do Nothing", style: .default)
            let secondAlertAction = UIAlertAction(title: "Print in console", style: .default) { (secondAlertAction) in
                print("The message that is displayed in the console, as a result of pressing the button")
            }
            
                alertController.addAction(firstAlertAction)
                alertController.addAction(secondAlertAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        alertButton.addAction(UIAction(handler: { _ in
            alertButtonTapped()
        }), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            alertButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
}
