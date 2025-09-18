//
//  Question.swift
//  tujuhin
//
//  Created by Tude Maha on 18/09/2025.
//

import Foundation

enum VoteState: String, Codable {
    case up, down, none
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        
        if rawValue.isEmpty {
            self = .none
            return
        }
        
        self = VoteState(rawValue: rawValue) ?? .none
    }
}

struct Question: Codable, Identifiable, Hashable {
    let id: UUID
    let question: String
    var totalVote: Int
    var voteState: VoteState
    let owner: User
    let createdAt: Date
}
