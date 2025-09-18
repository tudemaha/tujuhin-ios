//
//  User.swift
//  tujuhin
//
//  Created by Tude Maha on 18/09/2025.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    let id: UUID
    let name: String
    let username: String
}
