//
//  TimelineView.swift
//  tujuhin
//
//  Created by Tude Maha on 11/09/2025.
//

import SwiftUI

struct TimelineView: View {
    @StateObject private var questionViewModel = QuestionViewModel()
    
    var body: some View {
        ScrollView {
            if questionViewModel.isLoading {
                ProgressView("Loading data...")
            } else {
                VStack(spacing: 0) {
                    ForEach($questionViewModel.questions) { $question in
                        TimelineCard(
                            question: $question,
                            answerCount: 0,
                            showAnswerButton: false
                        )
                    }
                }
            }
        }
        .refreshable {
            Task {
                await questionViewModel.getQuestions()
            }
        }
        .task {
            await questionViewModel.getQuestions()
        }
    }
}

#Preview {
    TimelineView()
}
