//
//  UserCreationLoginViewController.swift
//  Dating App
//
//  Created by Mac on 25/08/2023.
//

import UIKit
import GoogleSignIn


class SigninViewController: UIViewController {
    
    var signinButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomButton()
        setupViews()
        view.backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.07450980392, blue: 0.1843137255, alpha: 1)
    }
    
    func setupCustomButton() {
        signinButton = GIDSignInButton()
        signinButton.style = .wide
        signinButton.addTarget(self, action: #selector(siginUserBtnTapped), for: .touchUpInside)
        signinButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupViews() {
        view.addSubview(signinButton)
        signinButton.addTarget(self, action: #selector(siginUserBtnTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            signinButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            signinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signinButton.heightAnchor.constraint(equalToConstant: 45),
            signinButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    @objc func siginUserBtnTapped() {
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
           guard error == nil else { return }

           // If sign in succeeded, display the app's main content View.
         }
        
    }
    
    
}

