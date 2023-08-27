//
//  ProfileCollectionViewCell.swift
//  Dating App
//
//  Created by Mac on 27/08/2023.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
    let identifier = "ProfileCollectionViewCell"
    
    lazy var profileImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
        return img
    }()
    
    let usernameLabel = Label(label: "", textColor: #colorLiteral(red: 0.8715636134, green: 0.8204910159, blue: 0.953423202, alpha: 1))
    
    let gmailLabel = Label(label: "", textColor:  #colorLiteral(red: 0.8715636134, green: 0.8204910159, blue: 0.953423202, alpha: 1))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUi()
    }
    
    func setupUi() {
        self.addSubview(profileImage)
        self.addSubview(usernameLabel)
        self.addSubview(gmailLabel)
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            usernameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10),
            usernameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            gmailLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10),
            gmailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
