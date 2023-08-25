//
//  TextField.swift
//  Dating App
//
//  Created by Mac on 25/08/2023.
//

import UIKit

//class TextField: UITextField {
//    init(placeholder: String, isSecureTextEntry: Bool) {
//            super.init(frame: .zero)
//            leftView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: self.frame.height))
//            leftViewMode = .always
//            translatesAutoresizingMaskIntoConstraints = false
//            layer.borderWidth = 1
//            font = UIFont(name: "", size: 18)
//            textColor = .gray
//            layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        let bottomLine = UIView()
//        bottomLine.backgroundColor = .black
//        addSubview(bottomLine)
//        autocapitalizationType = .none
//        autocorrectionType = .no
//        self.placeholder = placeholder
//        self.isSecureTextEntry = isSecureTextEntry
//            attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray5])
//        }
//        
//        required init?(coder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//        
//    }

class CustomTextField: UITextField {
    private let bottomLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTextField()
    }
    
    private func setupTextField() {
        borderStyle = .none
        font = UIFont.systemFont(ofSize: 16)
        textColor = .black
        //placeholder = ""
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(bottomLine)
        
        NSLayoutConstraint.activate([
            bottomLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomLine.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
