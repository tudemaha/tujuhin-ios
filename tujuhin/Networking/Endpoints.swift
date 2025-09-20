//
//  Endpoints.swift
//  tujuhin
//
//  Created by Tude Maha on 18/09/2025.
//

import Foundation

enum Endpoints {
    case login(_ loginData: LoginData)
    
    case fetchQuestions
    
    var urlRequest: URLRequest {
        var request: URLRequest
        let baseURL = Environment.baseURL
        
        switch self {
        case .login(let loginData):
            let url = URL(string: "\(baseURL)/auth/login")!
            request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = try? JSONEncoder().encode(loginData)
            
        case .fetchQuestions:
            let url = URL(string: "\(baseURL)/questions")!
            let bearer = KeychainAccess.readString("accessToken") ?? ""
            
            request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("Bearer \(bearer)", forHTTPHeaderField: "Authorization")
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}
