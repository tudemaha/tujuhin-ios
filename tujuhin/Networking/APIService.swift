//
//  APICall.swift
//  tujuhin
//
//  Created by Tude Maha on 18/09/2025.
//

import Foundation

protocol APIServiceProtocol {
    func fetchQuestions() async throws -> [Question]
}

class APIService: APIServiceProtocol {
    func fetchQuestions() async throws -> [Question] {
        guard let url = URL(string: "https://tujuhin-be-318821994572.us-west1.run.app/questions") else {
            throw URLError(.badURL)
        }
        
        let token = ""
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await URLSession.shared.data(for: request)
                
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        
        let response = try decoder.decode(APIResponse<QuestionData>.self, from: data)
        print(response)
        
        if let errorMessage = response.errors, !errorMessage.isEmpty {
            let combined = errorMessage.map { "\($0.key): \($0.value)" }.joined(separator: "\n")
            throw NSError(domain: "", code: response.code, userInfo: [NSLocalizedDescriptionKey: combined])
        }
                
        return response.data?.questions ?? []
    }
}
