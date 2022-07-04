//
//  Extension+OnboardingViewController.swift
//  Dating App
//
//  Created by Decagon on 03/07/2022.
//

import Foundation
import UIKit

// MARK: Protocols for the datasource and delegate of the collectionview
extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        cell.backgroundColor = indexPath.row % 2 == 0 ? #colorLiteral(red: 0.1019607843, green: 0.07450980392, blue: 0.1843137255, alpha: 1) : #colorLiteral(red: 1, green: 0, blue: 0.3019607843, alpha: 1)
        cell.heartImage.image = items[indexPath.row].image
        cell.heartImage.tintColor = indexPath.row % 2 == 0 ? #colorLiteral(red: 1, green: 0, blue: 0.3019607843, alpha: 1) : #colorLiteral(red: 0.1019607843, green: 0.07450980392, blue: 0.1843137255, alpha: 1)
        cell.titleLabel.text = items[indexPath.row].titleLabel
        cell.subTitleLabel.text = items[indexPath.row].subTitleLabel
        
        return cell
    }
    
}
