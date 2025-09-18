//
//  Endpoints.swift
//  tujuhin
//
//  Created by Tude Maha on 18/09/2025.
//

import Foundation

enum Endpoints {
    case login(username: String, password: String)
    
    case fetchQuestions
    
    var urlRequest: URLRequest {
        var request: URLRequest
        let baseURL = Environment.baseURL
        
        switch self {
        case .login(let username, let password):
            let url = URL(string: "\(baseURL)/auth/login")!
            request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = try? JSONEncoder().encode(["email": username, "password": password])
            
        case .fetchQuestions:
            let url = URL(string: "\(baseURL)/questions")!
            request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("Bearer \(String(describing: KeychainAccess.get("accessToken")))", forHTTPHeaderField: "Authorization")
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}
