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
        let baseURL = "https://tujuhin-be-318821994572.us-west1.run.app"
        
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
            request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImU0N2RkYzYyLTUzYjAtNGMwNC05ODZlLTUzOTIyN2E4OGU2OCIsIm5hbWUiOiJCYWd1cyBEZXZhIiwidXNlcm5hbWUiOiJiYWd1c2RldmEiLCJleHAiOjE3NTgyMTU4MzR9.rtIBmIsjFVrF3BMQsSZ_v7EjDDeU0RGBL-orQ3kmAaw", forHTTPHeaderField: "Authorization")
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}
