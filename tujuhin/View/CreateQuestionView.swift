//
//  CreateQuestionView.swift
//  tujuhin
//
//  Created by Tude Maha on 12/09/2025.
//

import SwiftUI

struct CreateQuestionView: View {
    @Binding var selectedTab: Int
    @State private var question: String = ""
    @State private var showConfirmation: Bool = false
    @FocusState private var questionFocus: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Button {
                    showConfirmation = true
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Ask")
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(question != "" ? .crimsonRed : .crimsonRed.opacity(0.6))
                        .clipShape(.capsule)
                }
                .disabled(question == "")
            }
            
            ScrollView {
                TextField("Write your question...", text: $question, axis: .vertical)
                    .multilineTextAlignment(.leading)
                    .focused($questionFocus)
            }
        }
        .padding(.horizontal)
        .toolbar(.hidden, for: .tabBar)
        .confirmationDialog("Discard Creating Question", isPresented: $showConfirmation) {
            Button("Discard", role: .destructive) {
                selectedTab = 0
                question = ""
            }
        } message: {
            Text("Your question will be deleted if discarded")
        }
    }
}

#Preview {
    CreateQuestionView(
        selectedTab: .constant(1)
    )
}
