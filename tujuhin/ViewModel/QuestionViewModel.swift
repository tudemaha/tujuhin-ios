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
    
    private let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
    }
    
    func getQuestions() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetchedQuestions = try await service.fetchQuestions()
            self.questions = fetchedQuestions
        } catch {
            self.errorMessage = error.localizedDescription
        }
        
        print(questions)
        
        isLoading = false
    }
}
