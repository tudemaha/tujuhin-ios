//
//  AuthModel.swift
//  tujuhin
//
//  Created by Tude Maha on 19/09/2025.
//

import Foundation

struct Tokens: Codable, Hashable {
    var accessToken: String
    var refreshToken: String
}

struct LoginData: Codable {
    var username: String
    var password: String
}

struct RegisterData: Codable {
    var name: String
    var username: String
    var password: String
    var passwordRepeat: String
}
