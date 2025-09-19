//
//  AuthAPI.swift
//  tujuhin
//
//  Created by Tude Maha on 19/09/2025.
//

import Foundation

class AuthAPI {
    func login(username: String, password: String) async throws -> Tokens {
        try await APIService.shared.request(
            .login(username: username, password: password),
            responseType: Tokens.self
        )
    }
}
