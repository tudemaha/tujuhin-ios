//
//  TImelineCard.swift
//  tujuhin
//
//  Created by Tude Maha on 11/09/2025.
//

import SwiftUI

struct TimelineCard: View {
    @Binding var question: Question
    var answerCount: Int
    var showAnswerButton: Bool
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Vote(score: $question.totalVote, currentVote: $question.voteState)
            
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(question.owner.name)
                            .fontWeight(.semibold)
                        HStack(spacing: 5) {
                            Text("@\(question.owner.username)")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            
                            Text("·")

                            Text(DateCalculation.getDuration(from: question.createdAt, to: Date()))
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                    Spacer()
                }
                
                Text(question.question)
                
                Divider()
                
                HStack {
                    if showAnswerButton {
                        NavigationLink {
                            DetailView()
                                .navigationTitle("Details")
                                .navigationBarTitleDisplayMode(.inline)
                                .toolbar(.hidden, for: .tabBar)
                        } label: {
                            Text(answerCount == 1 ? "1 answer" : "\(answerCount) answers")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        
                    } else {
                        Text(answerCount == 1 ? "1 answer" : "\(answerCount) answers")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    
                    if showAnswerButton {
                        NavigationLink {
                            DetailView()
                                .navigationTitle("Details")
                                .navigationBarTitleDisplayMode(.inline)
                                .toolbar(.hidden, for: .tabBar)
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
        }
        .padding()
        .background(.white)
        .padding(.bottom, 2)
        .background(.secondary)
    }
}

#Preview {
    TimelineCard(
        question: .constant(
            Question(
                id: UUID(),
                question: "where to buy kitchen utensils in jimbaran?",
                totalVote: 1,
                voteState: .up,
                owner: User(
                    id: UUID(),
                    name: "Tude Maha",
                    username: "@tudemaha"
                ),
                createdAt: Date()
            )
        ),
        answerCount: 0,
        showAnswerButton: true
    )
}
