//
//  JSONEncoder+Ext.swift
//  tujuhin
//
//  Created by Tude Maha on 20/09/2025.
//

import Foundation

extension JSONEncoder {
    static var commonnEncoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.dateEncodingStrategy = .iso8601
        
        return encoder
    }
}
