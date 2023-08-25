//
//  OnboardingViewController.swift
//  Dating App
//
//  Created by Decagon on 03/07/2022.
//

import UIKit
// MARK: - Elements/Properties in the Onboarding View controller
class OnboardingViewController: UIViewController {
    
    var itemsArray: [OnboardingModel] = []
    
    // MARK: Previous Button Properties
    lazy var previousButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.left.circle.fill"), for: .normal)
        button.tintColor = .systemGray6
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(prevBtnAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: Next Button Properties
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.right.circle.fill"), for: .normal)
        button.tintColor = .systemGray6
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(nextBtnAction), for: .touchUpInside)
        return button
    }  ()
    
    // MARK: Page Control Properties
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = items.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.8715636134, green: 0.8204910159, blue: 0.953423202, alpha: 1)
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.5700021982, green: 0.5888512135, blue: 0.5998489261, alpha: 1)
        pageControl.frame = CGRect(x: 0, y: 400, width: view.frame.size.width, height: view.frame.size.height)
        return pageControl
    }()
    
    // MARK: Stackview that is holding the previous, page control and next button
    lazy var bottomItems: UIStackView = {
        let bottomItems = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomItems.translatesAutoresizingMaskIntoConstraints = false
        bottomItems.distribution = .fillEqually
        view.addSubview(bottomItems)
        return bottomItems
    }()
    
    // MARK: Collectionview Properties
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.isPagingEnabled = true
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
        view.addSubview(collectionview)
        
        return collectionview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpviews()
        bottomControls()
    }
    // MARK: This previous action button that swipes back to the previous screens of the cells
    @objc func prevBtnAction() {
        let prevPage = pageControl.currentPage - 1
        let indexPath = IndexPath(item: prevPage, section: 0)
        pageControl.currentPage = prevPage
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    // MARK: This next action button presents the chatscreenviewcontroller at the last screen cells or swipes to the button at the first screen cells
    @objc func nextBtnAction() {
        if pageControl.currentPage == items.count - 1 {
            let nextScreen = TabBarViewController()
            nextScreen.modalPresentationStyle = .fullScreen
            nextScreen.modalTransitionStyle = .coverVertical
            self.present(nextScreen, animated: true, completion: nil)
        }else {
            let nextPage = pageControl.currentPage + 1
            let indexPath = IndexPath(item: nextPage, section: 0)
            pageControl.currentPage = nextPage
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        }
    }
    
    // MARK: This swipes the cells screen using the page control
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x/view.frame.width)
    }
    
    // MARK: Constraint for the stackview
    func bottomControls() {
        NSLayoutConstraint.activate([
            bottomItems.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomItems.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomItems.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        ])
    }
    
    func setUpviews() {
        view.addSubview(collectionView)
        
        // MARK: Constraint for the Elements in the collectionview
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}


