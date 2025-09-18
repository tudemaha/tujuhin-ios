//
//  QuestionViewModel.swift
//  tujuhin
//
//  Created by Tude Maha on 18/09/2025.
//

import Foundation

@MainActor
class QuestionViewModel: ObservableObject {
    @Published var questions: [Question] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let questionAPI = QuestionAPI()
    
    func getQuestions() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetchedQuestions = try await questionAPI.fetchQuestions()
            self.questions = fetchedQuestions
        } catch {
            self.errorMessage = error.localizedDescription
        }
        
        print(questions)
        
        isLoading = false
    }
}
