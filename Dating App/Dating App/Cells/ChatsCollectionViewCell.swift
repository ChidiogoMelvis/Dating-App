//
//  MessagesViewCell.swift
//  Dating App
//
//  Created by Decagon on 06/07/2022.
//

import UIKit
// MARK: The Message cells
class ChatsCollectionViewCell: UICollectionViewCell {
    
    lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    lazy var messageLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var dateLabel: UILabel = {
        let time = UILabel()
        time.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        time.translatesAutoresizingMaskIntoConstraints = false
        return time
    }()
    
    lazy var messageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let cells = [nameLabel, messageLabel, dateLabel]
        for cell in cells {
            view.addSubview(cell)
        }
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        self.backgroundColor = #colorLiteral(red: 0.8715636134, green: 0.8204910159, blue: 0.953423202, alpha: 1)
        self.layer.cornerRadius = 30
    }
    
    func setUpViews() {
        self.addSubview(profileImage)
        self.addSubview(messageView)
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            profileImage.heightAnchor.constraint(equalToConstant: 60),
            profileImage.widthAnchor.constraint(equalToConstant: 60),
            
            messageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            messageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 90),
            messageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            messageView.heightAnchor.constraint(equalToConstant: 70),
            
            nameLabel.topAnchor.constraint(equalTo: messageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: messageView.leadingAnchor),
            
            messageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: messageView.leadingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: messageView.topAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: messageView.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
