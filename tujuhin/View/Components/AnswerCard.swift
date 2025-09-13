//
//  AnswerCard.swift
//  tujuhin
//
//  Created by Tude Maha on 13/09/2025.
//

import SwiftUI

struct AnswerCard: View {
    var name: String
    var username: String
    var answer: String
    var answerCount: Int
    
    @State private var isReplied: Bool = false
    
    var body: some View {
        VStack {
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
                    isReplied = true
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
        }
    }
}

#Preview {
    AnswerCard(
        name: "Bagus Deva",
        username: "@bagusdeva",
        answer: "try in clandys jimbaran, lot of things there",
        answerCount: 1
    )
}
