//
//  TimelineView.swift
//  tujuhin
//
//  Created by Tude Maha on 11/09/2025.
//

import SwiftUI

struct TimelineView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                TimelineCard(
                    score: .constant(1),
                    currentVote: .constant(.none),
                    name: "Tude Maha",
                    username: "@tudemaha",
                    question: "Where i can buy kitchen utensils near park 23?",
                    responseCount: 1,
                    showAnswerButton: true
                )
                
                TimelineCard(
                    score: .constant(2),
                    currentVote: .constant(.up),
                    name: "Tude Maha",
                    username: "@tudemaha",
                    question: "plss i need pillow, where to get in denpasar?",
                    responseCount: 3,
                    showAnswerButton: true
                )
                
                TimelineCard(
                    score: .constant(0),
                    currentVote: .constant(.none),
                    name: "Tude Maha",
                    username: "@tudemaha",
                    question: "Where i can buy kitchen utensils near park 23?",
                    responseCount: 1,
                    showAnswerButton: true
                    
                )
                
                TimelineCard(
                    score: .constant(1),
                    currentVote: .constant(.none),
                    name: "Tude Maha",
                    username: "@tudemaha",
                    question: "Where i can buy kitchen utensils near park 23?",
                    responseCount: 1,
                    showAnswerButton: true

                )
                
                TimelineCard(
                    score: .constant(1),
                    currentVote: .constant(.none),
                    name: "Tude Maha",
                    username: "@tudemaha",
                    question: "Where i can buy kitchen utensils near park 23?",
                    responseCount: 1,
                    showAnswerButton: true

                )
            }
        }
        .refreshable {
            print("refreshed")
        }
    }
}

#Preview {
    TimelineView()
}
