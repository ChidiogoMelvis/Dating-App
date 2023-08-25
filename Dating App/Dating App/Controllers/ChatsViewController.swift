//
//  MessagesViewController.swift
//  Dating App
//
//  Created by Mac on 25/08/2023.
//

import UIKit

// MARK: The first view controller of the tabbar controller, subclassing and conforming to collectionview protocols
class ChatsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MessagesViewCell", for: indexPath) as! ChatsCollectionViewCell
        cell.backgroundColor = .lightGray
        cell.profileImage.backgroundColor = .gray
        cell.profileImage.layer.cornerRadius = 30
        cell.nameLabel.text = "John doe"
        cell.messageLabel.text = "John doe,John doe,John doe"
        cell.dateLabel.text = "01-01-1960"
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    // MARK: MessagesViewController Properties
    lazy var messagesLabel: UILabel = {
        let message = UILabel()
        message.text = "Messages"
        message.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        message.translatesAutoresizingMaskIntoConstraints = false
        message.textColor = #colorLiteral(red: 0.1019607843, green: 0.07450980392, blue: 0.1843137255, alpha: 1)
        return message
    }()
    
    lazy var divider: UIView = {
        let divider = UIView()
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = .white
        return divider
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.reloadData()
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.register(ChatsCollectionViewCell.self, forCellWithReuseIdentifier: "MessagesViewCell")
        view.addSubview(collectionview)
        
        return collectionview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8715636134, green: 0.8204910159, blue: 0.953423202, alpha: 1)
        setupViews()
    }
    
    // MARK: Constraints
    func setupViews() {
        view.addSubview(messagesLabel)
        view.addSubview(divider)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            messagesLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            messagesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            divider.topAnchor.constraint(equalTo: messagesLabel.bottomAnchor, constant: 5),
            divider.heightAnchor.constraint(equalToConstant: 2),
            divider.centerXAnchor.constraint(equalTo: divider.centerXAnchor),
            divider.widthAnchor.constraint(equalToConstant: view.frame.width),
            
            collectionView.topAnchor.constraint(equalTo: divider.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
        ])
    }
}
