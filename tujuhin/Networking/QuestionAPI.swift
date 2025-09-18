//
//  QuestionAPI.swift
//  tujuhin
//
//  Created by Tude Maha on 18/09/2025.
//

import Foundation

class QuestionAPI {
    func fetchQuestions() async throws -> [Question] {
        let questioinsRes = try await APIService.shared.request(.fetchQuestions, responseType: QuestionData.self)
        return questioinsRes.questions
    }
}
