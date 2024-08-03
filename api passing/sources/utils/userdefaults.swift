//
//  userdefaults.swift
//  api passing
//
//  Created by syeda manahil fatima on 03/08/2024.
//

import Foundation
protocol UserDefaultsKey {
    var key: String { get }
}

struct DefaultKey<T>: UserDefaultsKey {
    let key: String
}

// MARK: UserDefaults keys

extension UserDefaults {
    static let studentsKey = DefaultKey<[Airport]>(key: "students")
    static let lastLoginTime = DefaultKey<String>(key: "lastLoginTimeStamp")
}

extension UserDefaults {
    
    func set<T>(_ value: T, forKey key: UserDefaultsKey) {
        set(value, forKey: key.key)
    }
    
    func value<T>(forKey key: UserDefaultsKey) -> T? {
        return object(forKey: key.key) as? T
    }
    
    func set<T: Codable>(_ value: T, forKey key: UserDefaultsKey) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(value) {
            set(encoded, forKey: key.key)
        }
    }
    
    func codableValue<T: Codable>(forKey key: UserDefaultsKey) -> T? {
        guard let data = data(forKey: key.key) else { return nil }
        let decoder = JSONDecoder()
        return try? decoder.decode(T.self, from: data)
    }
}
