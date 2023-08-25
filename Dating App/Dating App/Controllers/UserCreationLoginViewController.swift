//
//  UserCreationLoginViewController.swift
//  Dating App
//
//  Created by Mac on 25/08/2023.
//

import UIKit

class UserCreationLoginViewController: UIViewController {
    
    let loginButton = Button(image: UIImage(systemName: ""), label: "Login", btnTitleColor: #colorLiteral(red: 0.1019607843, green: 0.07450980392, blue: 0.1843137255, alpha: 1), backgroundColor: #colorLiteral(red: 0.8715636134, green: 0.8204910159, blue: 0.953423202, alpha: 1), radius: 25, imageColor: .clear)
    
    let userCreateButton = Button(image: UIImage(systemName: ""), label: "Create User", btnTitleColor: .white, backgroundColor: #colorLiteral(red: 0.1019607843, green: 0.07450980392, blue: 0.1843137255, alpha: 1), radius: 25, imageColor: .clear)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        view.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.3019607843, alpha: 1)
    }
    
    func setupUi() {
        view.addSubview(loginButton)
        view.addSubview(userCreateButton)
        userCreateButton.addTarget(self, action: #selector(navigateToCreateUser), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            
            userCreateButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 50),
            userCreateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            userCreateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            userCreateButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func navigateToCreateUser() {
        let vc = CreateUserViewController()
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
    }

}
