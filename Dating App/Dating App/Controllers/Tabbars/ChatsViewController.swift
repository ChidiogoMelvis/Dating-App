//
//  ChatsViewController.swift
//  Dating App
//
//  Created by Mac on 14/09/2023.
//

import UIKit
import MessageKit
import Messages

class ChatsViewController: MessagesViewController {

    let messages: [ChatMessage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}


extension ChatsViewController: MessagesDataSource {
    var currentSender: MessageKit.SenderType {
        return Sender(senderId: "", displayName: "")
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageKit.MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return messages.count
    }
    
    
}
