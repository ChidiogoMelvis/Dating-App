//
//  ChatsViewController.swift
//  Dating App
//
//  Created by Decagon on 06/07/2022.
//

import UIKit
// MARK: The Chatsviewcontroller from the navigation of collectionview cells
class ChatsViewController: UIViewController {
    // MARK: It's properties
    lazy var chatsLabel: UILabel = {
        let message = UILabel()
        message.text = ""
        message.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        message.translatesAutoresizingMaskIntoConstraints = false
        message.textColor = #colorLiteral(red: 0.1019607843, green: 0.07450980392, blue: 0.1843137255, alpha: 1)
        return message
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    func setupView() {
        view.addSubview(chatsLabel)
        NSLayoutConstraint.activate([
            chatsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            chatsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
