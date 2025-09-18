//
//  Secrets.swift
//  tujuhin
//
//  Created by Tude Maha on 19/09/2025.
//

import Foundation

enum Environment {
    static var baseURL: String {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String else {
            fatalError("base URL not found")
        }
        
        return "https://\(url)"
    }
    
    static var accessGroup: String {
        guard let group = Bundle.main.object(forInfoDictionaryKey: "ACCESS_GROUP") as? String else {
            fatalError("access group not found")
        }
        
        return group
    }
}
