//
//  SmartUserDefaults.swift
//  SmartUserDefaults
//
//  Created by Yohta Watanave on 2020/02/24.
//  Copyright © 2020 Yohta Watanave. All rights reserved.
//

import Foundation

@propertyWrapper
public struct UserDefaultsProperty<T> {
    private let userDefaults: UserDefaults
    public let key: String
    private let defaultValue: T
    
    public init(userDefaults: UserDefaults = UserDefaults.standard, key: String, defaultValue: T) {
        self.userDefaults = userDefaults
        self.key = key
        self.defaultValue = defaultValue
    }
        
    public var wrappedValue: T {
        get {
            if T.self == URL.self {
                return userDefaults.url(forKey: key) as? T ?? defaultValue
            }
            else {
                return userDefaults.object(forKey: key) as? T ?? defaultValue
            }
        }
        set {
            if let newUrl = newValue as? URL {
                userDefaults.set(newUrl, forKey: key)
            }
            else {
                userDefaults.set(newValue, forKey: key)
            }
        }
    }
}

@propertyWrapper
public struct UserDefaultsOptionalProperty<T> {
    private let userDefaults: UserDefaults
    public let key: String
    
    public init(userDefaults: UserDefaults = UserDefaults.standard, key: String) {
        self.userDefaults = userDefaults
        self.key = key
    }
        
    public var wrappedValue: T? {
        get {
            if T.self == URL.self {
                return userDefaults.url(forKey: key) as? T
            }
            else {
                return userDefaults.object(forKey: key) as? T
            }
        }
        set {
            if let newValue = newValue {
                if let newUrl = newValue as? URL {
                    userDefaults.set(newUrl, forKey: key)
                }
                else {
                    userDefaults.set(newValue, forKey: key)
                }
                
            }
            else {
                userDefaults.removeObject(forKey: key)
            }
        }
    }
}
