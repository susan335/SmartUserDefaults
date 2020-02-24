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
public struct UserDefaultsEnumProperty<T> where T: RawRepresentable {
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
            guard let rawValue = userDefaults.object(forKey: key) as? T.RawValue else {
                return defaultValue
            }
            return T.init(rawValue: rawValue) ?? defaultValue
        }
        set {
            userDefaults.setValue(newValue.rawValue, forKey: key)
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

@propertyWrapper
public struct UserDefaultsOptionalEnumProperty<T> where T: RawRepresentable {
    private let userDefaults: UserDefaults
    public let key: String
    
    public init(userDefaults: UserDefaults = UserDefaults.standard, key: String) {
        self.userDefaults = userDefaults
        self.key = key
    }
        
    public var wrappedValue: T? {
        get {
            guard let rawValue = userDefaults.object(forKey: key) as? T.RawValue else {
                return nil
            }
            return T.init(rawValue: rawValue)
        }
        set {
            if let newValue = newValue {
                userDefaults.set(newValue.rawValue, forKey: key)
            }
            else {
                userDefaults.removeObject(forKey: key)
            }
        }
    }
}

public class FakeUserDefaults: UserDefaults {
    
    public var hashMap: [String: Any] = [:]
    
    public override func set(_ value: Any?, forKey key: String) {
        if let value = value {
            hashMap[key] = value
        }
        else {
            hashMap.removeValue(forKey: key)
        }
    }
    
    public override func set(_ url: URL?, forKey key: String) {
        if let url = url {
            hashMap[key] = url
        }
        else {
            hashMap.removeValue(forKey: key)
        }
    }
    
    public override func object(forKey key: String) -> Any? {
        hashMap[key]
    }
    
    public override func url(forKey key: String) -> URL? {
        hashMap[key] as? URL
    }
}
