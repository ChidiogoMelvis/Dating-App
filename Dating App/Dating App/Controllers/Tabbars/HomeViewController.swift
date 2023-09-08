//
//  MessagesViewController.swift
//  Dating App
//
//  Created by Mac on 25/08/2023.
//

import UIKit
import Firebase

// MARK: The first view controller of the tabbar controller, subclassing and conforming to collectionview protocols
class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
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
        setTitleColor()
        title = "Meetup"
        view.backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.07450980392, blue: 0.1843137255, alpha: 1)
        setupViews()
    }
    
    func setTitleColor() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    // MARK: Constraints
    func setupViews() {
        view.addSubview(divider)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            divider.heightAnchor.constraint(equalToConstant: 2),
            divider.centerXAnchor.constraint(equalTo: divider.centerXAnchor),
            divider.widthAnchor.constraint(equalToConstant: view.frame.width),
            
            collectionView.topAnchor.constraint(equalTo: divider.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MessagesViewCell", for: indexPath) as! ChatsCollectionViewCell
        cell.backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.07450980392, blue: 0.1843137255, alpha: 1)
        cell.profileImage.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.3019607843, alpha: 1)
        cell.profileImage.layer.cornerRadius = 30
        cell.nameLabel.text = "John doe"
        cell.messageLabel.text = "John doe,John doe,John doe"
        cell.dateLabel.text = "01-01-1960"
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ChatsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
