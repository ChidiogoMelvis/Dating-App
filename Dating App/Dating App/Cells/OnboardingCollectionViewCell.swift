//
//  OnboardingCollectionViewCell.swift
//  Dating App
//
//  Created by Decagon on 03/07/2022.
//

import UIKit

// MARK: The cells in the Collection view
class OnboardingCollectionViewCell: UICollectionViewCell {
    
    // MARK: The image model properties
    lazy var heartImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
        return img
    }()
    
    // MARK: The title label model properties
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.contentMode = .scaleAspectFill
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        label.textColor =  #colorLiteral(red: 0.8715636134, green: 0.8204910159, blue: 0.953423202, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: The subtitle label model properties
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.contentMode = .scaleAspectFill
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = #colorLiteral(red: 0.8715636134, green: 0.8204910159, blue: 0.953423202, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpviews()
    }
    
    // MARK: The contraints of the cells
    func setUpviews() {
        self.addSubview(heartImage)
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
        
        NSLayoutConstraint.activate([
            heartImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            heartImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            heartImage.heightAnchor.constraint(equalToConstant: 200),
            heartImage.widthAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: heartImage.bottomAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            subTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
