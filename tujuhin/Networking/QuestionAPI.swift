//
//  QuestionAPI.swift
//  tujuhin
//
//  Created by Tude Maha on 18/09/2025.
//

import Foundation

class QuestionAPI {
    func fetchQuestions() async throws -> [Question] {
        let questionsRes = try await APIService.shared.request(.fetchQuestions, responseType: QuestionData.self)
        return questionsRes.questions
    }
}
