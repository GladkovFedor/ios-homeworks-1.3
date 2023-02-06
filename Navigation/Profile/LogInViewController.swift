//
//  LogInViewController.swift
//  Navigation
//
//  Created by Федор Гладков on 28.11.2022.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {

    let scrollView: UIScrollView = {
        
        let sv = UIScrollView()
        
            sv.backgroundColor = .white
            sv.keyboardDismissMode = .interactive
            sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
        
    }()
    
    let logo: UIImageView = {
        
        let logo = UIImageView()
        
            logo.image = UIImage(named: "logo")
        
            logo.translatesAutoresizingMaskIntoConstraints = false
        
        return logo
        
    }()
    
    let logInStack: UIStackView = {
        
        let stack = UIStackView()
        
            stack.axis = .vertical
            stack.distribution = .fillProportionally
            stack.alignment = .center
            
            stack.layer.backgroundColor = UIColor.systemGray6.cgColor
            stack.layer.borderColor = UIColor.lightGray.cgColor
            stack.layer.borderWidth = 0.5
            stack.layer.cornerRadius = 10
        
            stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
        
    }()
    
    let loginTextField: UITextField = {
       
        let tf = UITextField()
        
            tf.placeholder = "Email or phone"
            tf.autocapitalizationType = .none
            tf.font = UIFont.systemFont(ofSize: 16)
            tf.textColor = .black
            
            tf.addTarget(self, action: #selector(loginTextFieldChanged), for: .editingChanged)
        
            tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
        
    }()
    
    let passwordTextField: UITextField = {
       
        let tf = UITextField()
        
            tf.placeholder = "Password"
            tf.autocapitalizationType = .none
            tf.font = UIFont.systemFont(ofSize: 16)
            tf.textColor = .black
            tf.isSecureTextEntry = true
        
            tf.addTarget(self, action: #selector(passwordTextFieldChanged), for: .editingChanged)
        
            tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
        
    }()
    
    let passwordRedView: UIView = {
        
        let view = UIView()
        
        view.backgroundColor = .red
        view.isHidden = true
        view.alpha = 0
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    let loginRedView: UIView = {
        
        let view = UIView()
        
        view.backgroundColor = .red
        view.isHidden = true
        view.alpha = 0
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    let middleBorder: UIView = {
        
        let border = UIView()
        
            border.backgroundColor = .lightGray
        
            border.translatesAutoresizingMaskIntoConstraints = false
        
        return border
    }()
    
    let logInButton: UIButton = {
        
        let btn = UIButton()
        
            btn.setTitle("Log In", for: .normal)
            btn.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
            btn.layer.cornerRadius = 10
            btn.setTitleColor(UIColor.white, for: .normal)
        
            btn.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        
            btn.clipsToBounds = true
            btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
        
    }()
    
    let invalidLengthLabel: UILabel = {
        
        let label = UILabel()
        
        label.text = "Недостаточное колчество символов пароля"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.alpha = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.tabBar.backgroundColor = .systemBackground
        view.backgroundColor = .systemBackground
        scrollView.backgroundColor = .white
        
        let safeLayout = self.view.safeAreaLayoutGuide
        
        navigationController?.navigationBar.isHidden = true
        
        addAllSubviews()
        
        NSLayoutConstraint.activate([
            
            view.topAnchor.constraint(equalTo: safeLayout.topAnchor),
            view.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor),
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            logo.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logo.heightAnchor.constraint(equalToConstant: 100),
            logo.widthAnchor.constraint(equalToConstant: 100),
            
            logInStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            logInStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            logInStack.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
            logInStack.heightAnchor.constraint(equalToConstant: 100),
            logInStack.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),
            
            invalidLengthLabel.topAnchor.constraint(equalTo: logInStack.bottomAnchor),
            invalidLengthLabel.leadingAnchor.constraint(equalTo: logInStack.leadingAnchor),
            invalidLengthLabel.trailingAnchor.constraint(equalTo: logInStack.trailingAnchor),
            invalidLengthLabel.bottomAnchor.constraint(equalTo: logInButton.topAnchor),
            
                loginTextField.widthAnchor.constraint(equalTo: logInStack.widthAnchor, constant: -30),
                
                passwordTextField.widthAnchor.constraint(equalTo: logInStack.widthAnchor, constant: -30),
                
                middleBorder.widthAnchor.constraint(equalTo: logInStack.widthAnchor),
                middleBorder.heightAnchor.constraint(equalToConstant: 0.5),
                middleBorder.leadingAnchor.constraint(equalTo: logInStack.leadingAnchor),
                middleBorder.trailingAnchor.constraint(equalTo: logInStack.trailingAnchor),
            
                passwordRedView.leadingAnchor.constraint(equalTo: logInStack.leadingAnchor),
                passwordRedView.trailingAnchor.constraint(equalTo: logInStack.trailingAnchor),
                passwordRedView.heightAnchor.constraint(equalToConstant: 50),
                passwordRedView.bottomAnchor.constraint(equalTo: logInStack.bottomAnchor),
                
                loginRedView.leadingAnchor.constraint(equalTo: logInStack.leadingAnchor),
                loginRedView.trailingAnchor.constraint(equalTo: logInStack.trailingAnchor),
                loginRedView.heightAnchor.constraint(equalToConstant: 50),
                loginRedView.topAnchor.constraint(equalTo: logInStack.topAnchor),
            
            logInButton.topAnchor.constraint(equalTo: logInStack.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: logInStack.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: logInStack.trailingAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeKeyboardEvents()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func addAllSubviews() {
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(logo)
        scrollView.addSubview(logInStack)
        scrollView.addSubview(invalidLengthLabel)
        logInStack.addArrangedSubview(loginTextField)
        logInStack.addArrangedSubview(middleBorder)
        logInStack.addArrangedSubview(passwordTextField)
        logInStack.addSubview(passwordRedView)
        logInStack.addSubview(loginRedView)
        scrollView.addSubview(logInButton)
        logInStack.clipsToBounds = true
        
    }

    @objc func loginTextFieldChanged(_ textField: UITextField) {
        
        loginTextField.clearButtonMode = .whileEditing
        
    }

    @objc func passwordTextFieldChanged(_ textField: UITextField) {
        
        passwordTextField.clearButtonMode = .whileEditing
        
    }
    
    @objc func logInButtonTapped(_ sender: UIButton) {
        
        guard !(loginTextField.text?.isEmpty ?? true) else {
            return UIView.animate(withDuration: 0.3, delay: 0, animations: {
                self.loginRedView.isHidden = false
                self.loginRedView.alpha = 0.5
                self.loginRedView.alpha = 0
            })
        }
        
        guard !(passwordTextField.text?.isEmpty ?? false) else {
            return UIView.animate(withDuration: 0.3, delay: 0, animations: {
                self.passwordRedView.isHidden = false
                self.passwordRedView.alpha = 0.5
                self.passwordRedView.alpha = 0
            })
        }
        
        guard (passwordTextField.text?.count ?? 0) > 5 else {
            return invalidLengthOfAPassword()
        }
        
        if (loginTextField.text != "Федя") || (passwordTextField.text != "ФедяФедя"){
            invalidValueOf(cell: "логина или пароля")
        } else {
            let vc = ProfileViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func invalidLengthOfAPassword() {
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.passwordRedView.isHidden = false
            self.passwordRedView.alpha = 0.5
            self.passwordRedView.alpha = 0
        })
        
        UIView.animate(withDuration: 2.5, delay: 0, options: .curveEaseInOut, animations: {
            self.invalidLengthLabel.alpha = 1
            self.invalidLengthLabel.alpha = 0
        })
    }
    
    func invalidValueOf(cell: String) {
        
        let alertController = UIAlertController(title: "Неверное значение \(cell)", message: "Попробуйте снова", preferredStyle: .alert)
        let firstAlertAction = UIAlertAction(title: "ОК", style: .default)
        
        alertController.addAction(firstAlertAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func subscribeKeyboardEvents() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
        
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
        guard let ks = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: ks.height, right: 0)
        
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        
        self.scrollView.contentInset = .zero
        
    }
    
}
