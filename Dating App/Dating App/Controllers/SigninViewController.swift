//
//  UserCreationLoginViewController.swift
//  Dating App
//
//  Created by Mac on 25/08/2023.
//

import UIKit
import GoogleSignIn
import Firebase

class SigninViewController: UIViewController {
    
    var signinButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFireBaseGidc()
        setupCustomButton()
        setupViews()
        view.backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.07450980392, blue: 0.1843137255, alpha: 1)
    }
    
    func configureFireBaseGidc() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
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
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
            guard error == nil else {
                print("error signing in\(error!.localizedDescription)")
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("error signing in\(error.localizedDescription)")
                    return
                }
                let vc = TabBarViewController()
                vc.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
}

