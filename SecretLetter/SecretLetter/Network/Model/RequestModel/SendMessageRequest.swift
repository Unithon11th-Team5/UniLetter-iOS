//
//  SendMessageRequest.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation

/*
 {
     "receiverNickname": "nick123",
     "senderName": "보내는 닉네임",
     "content": "보낼 메시지",
     "type": "메시지 타입",
     "sendPlannedAt": "2024-04-28"
 }
 */

struct SendMessageRequest: Codable, DictionaryConvertor {
    let receiverNickname: String
    let senderName: String
    let content: String
    let type: String
    let sendPlannedAt: String
    
    init(receiverNickname: String, senderName: String, content: String, type: String, sendPlannedAtDate: Date) {
        self.receiverNickname = receiverNickname
        self.senderName = senderName
        self.content = content
        self.type = type
        self.sendPlannedAt = DateHelper.shared.dateToString(date: sendPlannedAtDate)
    }
}
