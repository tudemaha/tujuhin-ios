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
