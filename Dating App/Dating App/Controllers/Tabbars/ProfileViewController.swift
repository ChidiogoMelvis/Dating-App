//
//  ProfileViewController.swift
//  Dating App
//
//  Created by Mac on 25/08/2023.
//

import UIKit
import GoogleSignIn
import GoogleSignInSwift

class ProfileViewController: UIViewController {
    
    lazy var profileImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .white
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 100
        img.clipsToBounds = true
        return img
    }()
    
    let usernameLabel = Label(label: "", textColor: #colorLiteral(red: 0.8715636134, green: 0.8204910159, blue: 0.953423202, alpha: 1))
    
    let gmailLabel = Label(label: "", textColor:  #colorLiteral(red: 0.8715636134, green: 0.8204910159, blue: 0.953423202, alpha: 1))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        setTitleColor()
        title = "Profile"
    }
    
    func setTitleColor() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8715636134, green: 0.8204910159, blue: 0.953423202, alpha: 1)]
    }
    
    func setupUi() {
        view.addSubview(profileImage)
        view.addSubview(usernameLabel)
        view.addSubview(gmailLabel)
//        if let profileImageURL = GIDSignIn.sharedInstance.currentUser?.profile?.imageURL(withDimension: 100) {
//            if let imageData = try? Data(contentsOf: profileImageURL) {
//                if let image = UIImage(data: imageData) {
//                    profileImage.image = image
//                }
//            }
//        }
        usernameLabel.text = GIDSignIn.sharedInstance.currentUser?.profile?.name
        gmailLabel.text = GIDSignIn.sharedInstance.currentUser?.profile?.email
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: 200),
            profileImage.widthAnchor.constraint(equalToConstant: 200),
            
            usernameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10),
            usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            gmailLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10),
            gmailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    
}
