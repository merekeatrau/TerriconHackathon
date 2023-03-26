//
//  NetworkModel.swift
//  OnayCode
//
//  Created by Arnur Sakenov on 25.03.2023.
//

import Foundation

struct CreateChatRequest: Encodable {
    let target_grade: String
    let technologies: [String]
    let stack: String
}

struct ChatResponse: Codable {
    let chat_id: String
    let target_grade: String
    let technologies: [String]
    let messages: [MessageResponse]
}

struct MessageResponse: Codable {
    let text: String
    let message_author: String
    let grade: Int?
}



struct CreateMessageRequest: Encodable {
    let content: String
}


