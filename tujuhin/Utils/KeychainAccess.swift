//
//  KeychainAccess.swift
//  tujuhin
//
//  Created by Tude Maha on 19/09/2025.
//

import Foundation
import Security

class KeychainAccess {
    static func save(_ data: String, account: String) {
        let addQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrAccessGroup as String: Environment.accessGroup,
            kSecValueData as String: data.utf8
        ]
        
        let status = SecItemAdd(addQuery as CFDictionary, nil)
        if status != errSecSuccess {
            print("Error adding data to keychain: \(status)")
        }
    }
    
    static func get(_ account: String) -> Data? {
        let getQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrAccessGroup as String: Environment.accessGroup,
            kSecReturnData as String: true,
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(getQuery as CFDictionary, &result)
        return status == errSecSuccess ? result as? Data : nil
    }
    
    static func delete(_ account: String) {
        let deleteQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrAccessGroup as String: Environment.accessGroup
        ]
        
        SecItemDelete(deleteQuery as CFDictionary)
    }
}
