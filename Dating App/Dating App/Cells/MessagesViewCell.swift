//
//  MessagesViewCell.swift
//  Dating App
//
//  Created by Decagon on 06/07/2022.
//

import UIKit
// MARK: The Message cells
class MessagesViewCell: UICollectionViewCell {
    var arrayMessages: [ChatModel] = []
    lazy var displayImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = #colorLiteral(red: 0.1019607843, green: 0.07450980392, blue: 0.1843137255, alpha: 1)
        return name
    }()
    
    lazy var messageLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = #colorLiteral(red: 0.1019607843, green: 0.07450980392, blue: 0.1843137255, alpha: 1)
        return text
    }()
    
    lazy var timeLabel: UILabel = {
        let time = UILabel()
        time.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        time.translatesAutoresizingMaskIntoConstraints = false
        time.textColor = #colorLiteral(red: 0.1019607843, green: 0.07450980392, blue: 0.1843137255, alpha: 1)
        return time
    }()
    
    lazy var messageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let cells = [nameLabel, messageLabel, timeLabel]
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
        self.addSubview(displayImage)
        self.addSubview(messageView)
        
        NSLayoutConstraint.activate([
            displayImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            displayImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            displayImage.heightAnchor.constraint(equalToConstant: 60),
            displayImage.widthAnchor.constraint(equalToConstant: 60),
            
            messageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            messageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 90),
            messageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            messageView.heightAnchor.constraint(equalToConstant: 70),
            
            nameLabel.topAnchor.constraint(equalTo: messageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: messageView.leadingAnchor),
            
            messageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: messageView.leadingAnchor),
            
            timeLabel.topAnchor.constraint(equalTo: messageView.topAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: messageView.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
