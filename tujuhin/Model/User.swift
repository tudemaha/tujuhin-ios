//
//  User.swift
//  tujuhin
//
//  Created by Tude Maha on 18/09/2025.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id: UUID
    var name: String
    var username: String
}
