//
//  DetailCard.swift
//  tujuhin
//
//  Created by Tude Maha on 11/09/2025.
//

import SwiftUI

struct DetailCard: View {
    @Binding var score: Int
    @Binding var currentVote: VoteState?
    var name: String
    var username: String
    var answer: String
    var answerCount: Int
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Vote(score: $score, currentVote: $currentVote)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(name)
                            .fontWeight(.semibold)
                        Text(username)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                }
                
                Text(answer)
                
                Divider()
                
                HStack {
                    Text(answerCount == 1 ? "1 reply" : "\(answerCount) replies")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        HStack(alignment: .center, spacing: 4) {
                            Image(systemName: "arrowshape.turn.up.left")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 15)
                                .bold()
                            
                            Text("Reply")
                                .font(.subheadline)
                                .bold()
                        }
                        .foregroundStyle(.gray)
                    }
                }
                
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
