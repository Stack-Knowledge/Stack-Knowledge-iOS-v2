import Foundation

struct DefaultKeychain {
    func save(key: KeychainType, value: String) {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecValueData: value.data(using: .utf8, allowLossyConversion: false) ?? .init(),
        ]
        SecItemDelete(query)
        SecItemAdd(query, nil)
    }

    func load(key: KeychainType) -> String {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecReturnData: kCFBooleanTrue!,
            kSecMatchLimit: kSecMatchLimitOne,
        ]
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        if status == errSecSuccess {
            guard let data = dataTypeRef as? Data else { return "" }
            return String(data: data, encoding: .utf8) ?? ""
        }
        return ""
    }

    func delete(key: KeychainType) {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
        ]
        SecItemDelete(query)
    }
}
