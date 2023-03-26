//
//  APIRequestManager.swift
//  OnayCode
//
//  Created by Arnur Sakenov on 25.03.2023.
//

import Foundation

import Alamofire

let baseURL = "https://europe-central2-it-bagalau.cloudfunctions.net/chat"

func createChat(request: CreateChatRequest, completion: @escaping (Result<ChatResponse, Error>) -> Void) {
    let urlString = "https://europe-central2-it-bagalau.cloudfunctions.net/chat"
    let headers: HTTPHeaders = ["Content-Type": "application/json"]

    AF.request(urlString, method: .post, parameters: request, encoder: JSONParameterEncoder.default, headers: headers)
        .validate()
        .responseJSON { response in
            print("Response JSON: \(response)")
        }
        .responseDecodable(of: ChatResponse.self) { response in
            switch response.result {
            case .success(let chatResponse):
                print("ChatResponse: \(chatResponse)")
                completion(.success(chatResponse))
            case .failure(let error):
                print("Error creating chat:", error)
                completion(.failure(error))
            }
        }

}


func createMessage(chatID: String, message: String, completion: @escaping (Result<MessageResponse, Error>) -> Void) {
    let urlString = "https://europe-central2-it-bagalau.cloudfunctions.net/chat/\(chatID)/message"
    let headers: HTTPHeaders = ["Content-Type": "application/json"]
    let request = CreateMessageRequest(content: message)

    AF.request(urlString, method: .post, parameters: request, encoder: JSONParameterEncoder.default, headers: headers)
        .validate()
        .responseJSON { response in
            print("Response JSON: \(response)")
        }
        .responseDecodable(of: MessageResponse.self) { response in
            switch response.result {
            case .success(let messageResponse):
                print("MessageResponse: \(messageResponse)")
                completion(.success(messageResponse))
            case .failure(let error):
                print("Error sending message:", error)
                completion(.failure(error))
            }
        }

}

//type СreateChatRequest struct {
//    TargetGrade string `json:"target_grade"`
//    Technologies []string `json:"technologies"`
//    Stack string `json:"stack"
//}
//type ChatResponse struct {
//    ChatId string `json:"chat_id"
//    TargetGrade string `json:"target_grade"`
//    Technologies []string `json:"technologies"`
//    Messages []MessageResponse `json:"messages"`
//}
//type CreateMessageRequest struct {
//    Content string `json:"content"`
//}
//type MessageResponse struct {
//    Text string `json:"text"`
//    MessageAuthor string `json:"message_author"`
//    Grade         *int `json:"grade,omitempty"`
//}
