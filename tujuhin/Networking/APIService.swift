//
//  APICall.swift
//  tujuhin
//
//  Created by Tude Maha on 18/09/2025.
//

import Foundation

class APIService {
    static let shared = APIService()
    private let decoder: JSONDecoder
    
    init() {
        decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
    }
    
    func request<T: Codable>(_ endpoint: Endpoints, responseType: T.Type) async throws -> T {
        let (data, _) = try await URLSession.shared.data(for: endpoint.urlRequest)
        
        if let raw = String(data: data, encoding: .utf8) {
            print(raw)
        }
        
        let response = try decoder.decode(APIResponse<T>.self, from: data)
        
        if let errorMessage = response.errors, !errorMessage.isEmpty {
            let combined = errorMessage.map { "\($0.key): \($0.value)" }.joined(separator: "\n")
            throw NSError(domain: "", code: response.code, userInfo: [NSLocalizedDescriptionKey: combined])
        }
        
        return response.data!
    }
}
