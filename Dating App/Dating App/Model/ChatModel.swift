//
//  Tableview Model.swift
//  Dating App
//
//  Created by Decagon on 05/07/2022.
//

import Foundation
import UIKit
// MARK: The Model data for the message cells
struct ChatModel {
    var displayImage: UIImage?
    var name: String
    var text: String
    var time: String
} 
var chatModel = [
    ChatModel(displayImage: UIImage(named: "img3"), name: "Rebecca Hauwa", text: "When are you travelling for the festive season", time: "12:14pm"),
    ChatModel(displayImage: UIImage(named: "img3"), name: "Maryann Bole", text: "When are you travelling for the festive season", time: "12:14pm"),
    ChatModel(displayImage: UIImage(named: "img3"), name: "Abigail Samson", text: "When are you travelling for the festive season", time: "12:14pm"),
    ChatModel(displayImage: UIImage(named: "img3"), name: "Belle Mo", text: "When are you travelling for the festive season", time: "12:14pm"),
    ChatModel(displayImage: UIImage(named: "img3"), name: "Nneka Simeon", text: "When are you travelling for the festive season", time: "12:14pm"),
    ChatModel(displayImage: UIImage(named: "img3"), name: "Janet Chi", text: "When are you travelling for the festive season", time: "12:14pm"),
    ChatModel(displayImage: UIImage(named: "img3"), name: "Monica Daks", text: "When are you travelling for the festive season", time: "12:14pm"),
    ChatModel(displayImage: UIImage(named: "img3"), name: "June Maggi", text: "When are you travelling for the festive season", time: "12:14pm"),
    ChatModel(displayImage: UIImage(named: "img3"), name: "Hilda Chee", text: "When are you travelling for the festive season", time: "12:14pm"),
    ChatModel(displayImage: UIImage(named: "img3"), name: "Melvis Me", text: "When are you travelling for the festive season", time: "12:14pm")
]



