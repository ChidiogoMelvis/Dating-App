//
//  ChatsViewController.swift
//  Dating App
//
//  Created by Mac on 25/08/2023.
//

import UIKit

class ChatsViewController: UIViewController {
    
    let chatsTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureChatsTextField()
        title = "Chats"
        view.backgroundColor = .white
    }
   
    func configureChatsTextField() {
        chatsTextField.placeholder = "Message"
        chatsTextField.backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.07450980392, blue: 0.1843137255, alpha: 1);      chatsTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chatsTextField)
        chatsTextField.layer.cornerRadius = 30
        chatsTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
        chatsTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14).isActive = true
        chatsTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14).isActive = true
        chatsTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }

}
