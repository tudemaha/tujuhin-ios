//
//  DetailCard.swift
//  tujuhin
//
//  Created by Tude Maha on 11/09/2025.
//

import SwiftUI

struct DetailCard: View {
    @Binding var score: Int
    @Binding var currentVote: VoteState
    var name: String
    var username: String
    var answer: String
    var answerCount: Int
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Vote(score: $score, currentVote: $currentVote)
            
            VStack(alignment: .leading, spacing: 10) {
                AnswerCard(name: name, username: username, answer: answer, answerCount: answerCount)
                
                ReplyCard()
                
                ReplyCard()
            }
        }
        .padding()
    }
}

#Preview {
    DetailCard(
        score: .constant(1),
        currentVote: .constant(.none),
        name: "John Doe",
        username: "@johndoe",
        answer: "try in clandys jimbaran, lot of things there",
        answerCount: 1
    )
}
