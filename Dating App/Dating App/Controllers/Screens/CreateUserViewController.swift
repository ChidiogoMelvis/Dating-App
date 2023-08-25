//
//  CreateUserViewController.swift
//  Dating App
//
//  Created by Mac on 25/08/2023.
//

import UIKit
import Appwrite

class CreateUserViewController: UIViewController {
    
    let emailTextField: CustomTextField = {
            let textField = CustomTextField()
        textField.placeholder = "email"
            return textField
        }()
    
    let passwordTextField: CustomTextField = {
            let textField = CustomTextField()
        textField.placeholder = "password"
        textField.isSecureTextEntry = true
            return textField
        }()
    
    let createUserButton = Button(image: UIImage(systemName: ""), label: "Create user", btnTitleColor: #colorLiteral(red: 0.1019607843, green: 0.07450980392, blue: 0.1843137255, alpha: 1), backgroundColor: .clear, radius: 0, imageColor: .clear)
        
        override func viewDidLoad() {
            super.viewDidLoad()
            title = "Create User"
            setupUi()
            view.backgroundColor = .white
        }
    
    func setupUi() {
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(createUserButton)
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 50),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            
            createUserButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            createUserButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
}
