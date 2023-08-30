//
//  UserCreationLoginViewController.swift
//  Dating App
//
//  Created by Mac on 25/08/2023.
//

import UIKit


class SigninViewController: UIViewController {
    
    let signinButton = Button(image: UIImage(systemName: ""), label: "Signin User with Gmail?", btnTitleColor: #colorLiteral(red: 0.8715636134, green: 0.8204910159, blue: 0.953423202, alpha: 1), backgroundColor: .clear, radius: 25, imageColor: .clear)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        view.backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.07450980392, blue: 0.1843137255, alpha: 1)
    }
    
    func setupUi() {
        view.addSubview(signinButton)
        signinButton.addTarget(self, action: #selector(siginUserBtnTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            signinButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            signinButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            signinButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
        ])
    }
    
    @objc func siginUserBtnTapped() {
        
    }

        
    }

