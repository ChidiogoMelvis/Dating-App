//
//  ChatScreenViewController.swift
//  Dating App
//
//  Created by Decagon on 04/07/2022.
//

import UIKit
// MARK: The Tabbarcontrollers with its subviews of view controllers
class HomeTabBarViewController: UITabBarController {
    // MARK: Declaring the subview controllers into a navigation controller
    let controllers = UITabBarController()
    let firstVC = UINavigationController(rootViewController: MessagesViewController())
    let secondVC = UINavigationController(rootViewController: FindDatesViewController())
    let thirdVC = UINavigationController(rootViewController: ProfileViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        view.backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.07450980392, blue: 0.1843137255, alpha: 1)
    }
    
    func setupViewController() {
        let vcIcons = ["message.fill", "person.3.fill", "person.fill"]
        
        firstVC.title = "Chat"
        secondVC.title = "Find"
        thirdVC.title = "Profile"
        
        setViewControllers([firstVC, secondVC, thirdVC], animated: true)
        tabBar.tintColor = #colorLiteral(red: 0.8715636134, green: 0.8204910159, blue: 0.953423202, alpha: 1)
        tabBar.backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.07450980392, blue: 0.1843137255, alpha: 1)
        tabBar.layer.cornerRadius = 20
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.6784313725, green: 0.3843137255, blue: 0.6666666667, alpha: 1)
        
        guard let icons = self.tabBar.items else { return }
        
        for icon in 0...2 {
            icons[icon].image = UIImage(systemName: vcIcons[icon])
        }
    }
}
// MARK: The first view controller of the tabbar controller, subclassing and conforming to collectionview protocols
class MessagesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MessagesViewCell", for: indexPath) as! MessagesViewCell
        cell.displayImage.image = chatModel[indexPath.row].displayImage
        cell.nameLabel.text = chatModel[indexPath.row].name
        cell.messageLabel.text = chatModel[indexPath.row].text
        cell.timeLabel.text = chatModel[indexPath.row].time
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let chatScreen = ChatsViewController()
        chatScreen .modalPresentationStyle = .fullScreen
        chatScreen .modalTransitionStyle = .coverVertical
        show(chatScreen, sender: self)
        chatScreen.chatsLabel.text = chatModel[indexPath.row].name
    }
    
    func pushView() {
        let controller = UINavigationController(rootViewController: ChatsViewController())
        self.navigationController?.pushViewController(controller, animated: true)
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
        collectionview.register(MessagesViewCell.self, forCellWithReuseIdentifier: "MessagesViewCell")
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
// MARK: The Second view controller of the tabbar controller
class FindDatesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }
}
// MARK: The Third view controller of the tabbar controller
class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}

