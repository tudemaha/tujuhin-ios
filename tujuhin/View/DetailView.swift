//
//  DetailView.swift
//  tujuhin
//
//  Created by Tude Maha on 11/09/2025.
//

import SwiftUI

struct DetailView: View {
    @State private var comment: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            TimelineCard(
                score: .constant(1),
                currentVote: .constant(.none),
                name: "Tude Maha",
                username: "@tudemaha",
                question: "Where i can buy kitchen utensils near park 23?",
                responseCount: 1,
                showAnswerButton: false
            )
            
            ScrollView {
                VStack {
                    DetailCard(
                        score: .constant(1),
                        currentVote: .constant(.none),
                        name: "John Doe",
                        username: "@johndoe",
                        answer: "try in clandys jimbaran, lot of things there",
                        answerCount: 1
                    )
                    
                    Divider()
                    
                    DetailCard(
                        score: .constant(2),
                        currentVote: .constant(.up),
                        name: "John Doe",
                        username: "@johndoe",
                        answer: "try in clandys jimbaran, lot of things there",
                        answerCount: 1
                    )
                }
            }
            .refreshable {
                
            }
            
            HStack(alignment: .center) {
                TextField("Write your tought...", text: $comment)
                    .frame(height: 30)
                    .padding(.horizontal, 10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(isFocused ? Color.crimsonRed.opacity(0.5) : Color.gray.opacity(0.5))
                    }
                    .focused($isFocused)
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane.fill")
                        .foregroundStyle(.white)
                        .padding(5)
                        .background(comment != "" ? .crimsonRed : .crimsonRed.opacity(0.6))
                        .clipShape(.circle)
                }
                .disabled(comment == "")
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    DetailView()
}
