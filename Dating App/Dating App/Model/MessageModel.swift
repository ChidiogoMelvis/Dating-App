//
//  MessageModel.swift
//  Dating App
//
//  Created by Mac on 05/09/2023.
//

import Foundation
import MessageKit

struct ChatMessage: MessageType{
    var sender: MessageKit.SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKit.MessageKind
}

