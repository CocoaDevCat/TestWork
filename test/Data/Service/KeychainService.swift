//
//  KeychainService.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import Foundation

protocol KeychainServiceProtocol {
    func save(_ token: String)
    func get() -> String?
    func delete()
}

class KeychainService: KeychainServiceProtocol {
    
    private let account = "AuthToken"
    private let service = "com.example.work.test"
    
    func save(_ token: String) {
        let data = Data(token.utf8)
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: service
        ]
        SecItemDelete(query as CFDictionary)
        
        let attributes: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: service,
            kSecValueData as String: data
        ]
        
        SecItemAdd(attributes as CFDictionary, nil)
    }
    
    func get() -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: service,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        if status == errSecItemNotFound { return nil }
        
        guard status == errSecSuccess,
              let data = item as? Data,
              let token = String(data: data, encoding: .utf8)
        else {
            return nil
        }
        
        return token
    }
    
    func delete() {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: service
        ]
        
        SecItemDelete(query as CFDictionary)
    }
}
