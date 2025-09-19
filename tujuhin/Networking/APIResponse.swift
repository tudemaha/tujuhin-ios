//
//  APIResponse.swift
//  tujuhin
//
//  Created by Tude Maha on 18/09/2025.
//

import Foundation

struct APIResponse<T: Codable>: Codable {
    let code: Int
    let message: String
    let errors: [APIError]?
    let data: T?
}

struct APIError: Codable {
    let key: String
    let value: String
}

