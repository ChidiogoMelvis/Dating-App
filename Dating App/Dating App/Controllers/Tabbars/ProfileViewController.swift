//
//  ProfileViewController.swift
//  Dating App
//
//  Created by Mac on 25/08/2023.
//

import UIKit
import GoogleSignIn
import GoogleSignInSwift

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var profileCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: "ProfileCollectionViewCell")
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        setTitleColor()
        title = "Profile"
    }
    
    func setTitleColor() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8715636134, green: 0.8204910159, blue: 0.953423202, alpha: 1)]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as! ProfileCollectionViewCell
        cell.profileImage.image = UIImage(systemName: "")
        cell.usernameLabel.text = GIDSignIn.sharedInstance.currentUser?.profile?.name
        cell.gmailLabel.text = GIDSignIn.sharedInstance.currentUser?.profile?.email
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func setupUi() {
        view.addSubview(profileCollectionView)
        
        NSLayoutConstraint.activate([
            profileCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            profileCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            profileCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            profileCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
        ])
    }
}
