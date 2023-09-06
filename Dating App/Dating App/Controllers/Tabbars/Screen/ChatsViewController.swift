//
//  ChatsViewController.swift
//  Dating App
//
//  Created by Mac on 25/08/2023.
//

import UIKit

class ChatsViewController: UIViewController, UITextFieldDelegate {
    
    lazy var chatsTextField: UITextField = {
        let chatsTextField = UITextField()
        chatsTextField.placeholder = "Message"
        chatsTextField.backgroundColor = #colorLiteral(red: 0.8715636134, green: 0.8204910159, blue: 0.953423202, alpha: 1);
        chatsTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.view.frame.height))
        chatsTextField.leftViewMode = .always
        chatsTextField.delegate = self
        chatsTextField.translatesAutoresizingMaskIntoConstraints = false
        chatsTextField.layer.cornerRadius = 8
        return chatsTextField
    }()
    
    let sendButton = Button(image: UIImage(systemName: ""), label: "Enter", btnTitleColor: #colorLiteral(red: 0.8715636134, green: 0.8204910159, blue: 0.953423202, alpha: 1), backgroundColor: .clear, radius: 0, imageColor: .clear)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitleColor()
        configureViews()
        title = "Chats"
        view.backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.07450980392, blue: 0.1843137255, alpha: 1)
    }
    
    func setTitleColor() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8715636134, green: 0.8204910159, blue: 0.953423202, alpha: 1)]
    }
    
    func configureViews() {
        view.addSubview(chatsTextField)
        view.addSubview(sendButton)
        NSLayoutConstraint.activate([
            chatsTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            chatsTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            chatsTextField.widthAnchor.constraint(equalToConstant: 300),
            chatsTextField.heightAnchor.constraint(equalToConstant: 45),
            
            sendButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -95),
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
        ])
    }
    
}
