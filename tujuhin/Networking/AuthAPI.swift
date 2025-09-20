//
//  AuthAPI.swift
//  tujuhin
//
//  Created by Tude Maha on 19/09/2025.
//

import Foundation

class AuthAPI {
    func login(_ loginData: LoginData) async throws -> Tokens {
        try await APIService.shared.request(
            .login(loginData),
            responseType: Tokens.self
        )
    }
    
    func register(_ registerData: RegisterData) async throws {
        _ = try await APIService.shared.request(
            .register(registerData),
            responseType: EmptyResponse.self
        )
    }
}
