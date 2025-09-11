//
//  TImelineCard.swift
//  tujuhin
//
//  Created by Tude Maha on 11/09/2025.
//

import SwiftUI

struct TimelineCard: View {
    @Binding var score: Int
    @Binding var currentVote: VoteState?
    var name: String
    var username: String
    var question: String
    var responseCount: Int
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Vote(score: $score, currentVote: $currentVote)
            
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(name)
                        Text(username)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                }
                
                Text(question)
                    .font(.title3)
                
                Divider()
                
                HStack {
                    Text(responseCount == 1 ? "1 answer" : "\(responseCount) answers")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        HStack(alignment: .center, spacing: 4) {
                            Image(systemName: "lightbulb.max")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 15)
                                .bold()
                            
                            Text("Answer")
                                .font(.subheadline)
                                .bold()
                        }
                        .foregroundStyle(.gray)
                    }
                }
            }
        }
        .padding()
        .background(.white)
        .padding(.bottom, 2)
        .background(.secondary)
    }
}

#Preview {
    TimelineCard(
        score: .constant(0),
        currentVote: .constant(.none),
        name: "Tude Maha",
        username: "@tudemaha",
        question: "Where i can buy kitchen utensils near park 23?",
        responseCount: 0
    )
}
