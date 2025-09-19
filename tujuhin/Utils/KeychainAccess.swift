//
//  KeychainAccess.swift
//  tujuhin
//
//  Created by Tude Maha on 19/09/2025.
//

import Foundation
import Security

class KeychainAccess {
    static func save(_ token: String, account: String) {
//        make sure the token is Data, not string directly
        guard let tokenData = token.data(using: .utf8) else { return }
        let addQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecValueData as String: tokenData
        ]
        
//        delete old items if exists, make error if just overwrite old value
        SecItemDelete(addQuery as CFDictionary)
        let status = SecItemAdd(addQuery as CFDictionary, nil)
        if status != errSecSuccess {
            print("Error adding data to keychain: \(status)")
        }
    }
    
    static func get(_ account: String) -> Data? {
        let getQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecReturnData as String: true,
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(getQuery as CFDictionary, &result)
        return status == errSecSuccess ? result as? Data : nil
    }
    
    static func readString(_ account: String) -> String? {
        guard let data = get(account) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    static func delete(_ account: String) {
        let deleteQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
        ]
        
        SecItemDelete(deleteQuery as CFDictionary)
    }
}
