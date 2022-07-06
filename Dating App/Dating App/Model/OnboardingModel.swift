//
//  OnboardingModel.swift
//  Dating App
//
//  Created by Decagon on 03/07/2022.
//

import Foundation
import UIKit
// MARK: The Model data for the onboarding cells
struct OnboardingModel {
    let image: UIImage?
    let titleLabel: String
    let subTitleLabel: String
}

var items = [
    OnboardingModel(image: UIImage(systemName: "heart.fill"), titleLabel: "Get a Date", subTitleLabel: "Swipe right to get a match with \n people you like from your area"),
    OnboardingModel(image: UIImage(systemName: "message.fill"), titleLabel: "Private Messages", subTitleLabel: "Chat privately with people you \n match"),
    OnboardingModel(image: UIImage(systemName: "bell.fill"), titleLabel: "Get Notified", subTitleLabel: "Receive notifications when you get \n new messages and matches")
]


