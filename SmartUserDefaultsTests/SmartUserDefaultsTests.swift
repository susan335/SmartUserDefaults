//
//  SmartUserDefaultsTests.swift
//  SmartUserDefaultsTests
//
//  Created by Yohta Watanave on 2020/02/24.
//  Copyright © 2020 Yohta Watanave. All rights reserved.
//

import XCTest
import SmartUserDefaults

class SmartUserDefaultsTests: XCTestCase {

    var userDefaultsModel: UserDefaultsModel!
    var fakeUserDefaultsModel: FakeUserDefaultsModel!
    
    override func setUp() {
        UserDefaults.standard
            .removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        self.userDefaultsModel = UserDefaultsModel()
        
        FakeUserDefaultsModel.userDefaults = FakeUserDefaults()
        self.fakeUserDefaultsModel = FakeUserDefaultsModel()
    }

    func test_String() {
        XCTAssertEqual(userDefaultsModel.string, "str")
        userDefaultsModel.string = "hoge"
        XCTAssertEqual(userDefaultsModel.string, "hoge")
        
        XCTAssertNil(userDefaultsModel.optString)
        userDefaultsModel.optString = "fuga"
        XCTAssertEqual(userDefaultsModel.optString, "fuga")
        userDefaultsModel.optString = nil
        XCTAssertNil(userDefaultsModel.optString)
    }
    
    func test_Array() {
        XCTAssertEqual(userDefaultsModel.array, [0, 1, 2])
        userDefaultsModel.array = [4, 3, 2]
        XCTAssertEqual(userDefaultsModel.array, [4, 3, 2])
        
        XCTAssertNil(userDefaultsModel.optArray)
        userDefaultsModel.optArray = [0, 0, 0]
        XCTAssertEqual(userDefaultsModel.optArray, [0, 0, 0])
        userDefaultsModel.optArray = nil
        XCTAssertNil(userDefaultsModel.optArray)
    }
    
    func test_Dictionary() {
        XCTAssertEqual(userDefaultsModel.dictionary, ["k1": 0, "k2": 2])
        userDefaultsModel.dictionary = ["k3": 1]
        XCTAssertEqual(userDefaultsModel.dictionary, ["k3": 1])
        
        XCTAssertNil(userDefaultsModel.optDictionary)
        userDefaultsModel.optDictionary = ["k4": 4]
        XCTAssertEqual(userDefaultsModel.optDictionary, ["k4": 4])
        userDefaultsModel.optDictionary = nil
        XCTAssertNil(userDefaultsModel.optDictionary)
    }
    
    func test_URL() {
        let url = URL(string: "https://google.com")!
        XCTAssertEqual(userDefaultsModel.url, URL(fileURLWithPath: "/"))
        userDefaultsModel.url = url
        XCTAssertEqual(userDefaultsModel.url, url)
        
        XCTAssertNil(userDefaultsModel.optUrl)
        userDefaultsModel.optUrl = url
        XCTAssertEqual(userDefaultsModel.optUrl, url)
        userDefaultsModel.optUrl = nil
        XCTAssertNil(userDefaultsModel.optUrl)
    }
    
    func test_StringArray() {
        XCTAssertEqual(userDefaultsModel.stringArray, ["a", "b", "c"])
        userDefaultsModel.stringArray = ["d", "d"]
        XCTAssertEqual(userDefaultsModel.stringArray, ["d", "d"])
        
        XCTAssertNil(userDefaultsModel.optStringArray)
        userDefaultsModel.optStringArray = ["e", "t"]
        XCTAssertEqual(userDefaultsModel.optStringArray, ["e", "t"])
        userDefaultsModel.optStringArray = nil
        XCTAssertNil(userDefaultsModel.optStringArray)
    }
    
    func test_Data() {
        XCTAssertEqual(userDefaultsModel.data, "str".data(using: .utf8))
        userDefaultsModel.data = "data".data(using: .utf8)!
        XCTAssertEqual(userDefaultsModel.data, "data".data(using: .utf8))
        
        XCTAssertNil(userDefaultsModel.optData)
        userDefaultsModel.optData = "opt".data(using: .utf8)!
        XCTAssertEqual(userDefaultsModel.optData, "opt".data(using: .utf8))
        userDefaultsModel.optData = nil
        XCTAssertNil(userDefaultsModel.optData)
    }
    
    func test_Bool() {
        XCTAssertTrue(userDefaultsModel.bool)
        userDefaultsModel.bool = false
        XCTAssertFalse(userDefaultsModel.bool)
        
        XCTAssertNil(userDefaultsModel.optBool)
        userDefaultsModel.optBool = true
        XCTAssertTrue(userDefaultsModel.optBool!)
        userDefaultsModel.optBool = nil
        XCTAssertNil(userDefaultsModel.optBool)
    }
    
    func test_Int() {
        XCTAssertEqual(userDefaultsModel.int, 128)
        userDefaultsModel.int = 255
        XCTAssertEqual(userDefaultsModel.int, 255)
        
        XCTAssertNil(userDefaultsModel.optInt)
        userDefaultsModel.optInt = 512
        XCTAssertEqual(userDefaultsModel.optInt, 512)
        userDefaultsModel.optInt = nil
        XCTAssertNil(userDefaultsModel.optInt)
    }
    
    func test_Float() {
        XCTAssertEqual(userDefaultsModel.float, 0.25)
        userDefaultsModel.float = 75.5
        XCTAssertEqual(userDefaultsModel.float, 75.5)
        
        XCTAssertNil(userDefaultsModel.optFloat)
        userDefaultsModel.optFloat = -44.3
        XCTAssertEqual(userDefaultsModel.optFloat, -44.3)
        userDefaultsModel.optFloat = nil
        XCTAssertNil(userDefaultsModel.optFloat)
    }
    
    func test_Double() {
        XCTAssertEqual(userDefaultsModel.double, 0.75)
        userDefaultsModel.double = 75.5
        XCTAssertEqual(userDefaultsModel.double, 75.5)
        
        XCTAssertNil(userDefaultsModel.optDouble)
        userDefaultsModel.optDouble = -44.3
        XCTAssertEqual(userDefaultsModel.optDouble, -44.3)
        userDefaultsModel.optDouble = nil
        XCTAssertNil(userDefaultsModel.optDouble)
    }
    
    func test_Enum() {
        XCTAssertEqual(userDefaultsModel.enumValue, .red)
        userDefaultsModel.enumValue = .blue
        XCTAssertEqual(userDefaultsModel.enumValue, .blue)
        
        XCTAssertNil(userDefaultsModel.optEnumValue)
        userDefaultsModel.optEnumValue = .yellow
        XCTAssertEqual(userDefaultsModel.optEnumValue, .yellow)
        userDefaultsModel.optEnumValue = nil
        XCTAssertNil(userDefaultsModel.optEnumValue)
    }
    
    func test_Fake_String() {
        XCTAssertEqual(fakeUserDefaultsModel.string, "str")
        fakeUserDefaultsModel.string = "hoge"
        XCTAssertEqual(fakeUserDefaultsModel.string, "hoge")
        
        XCTAssertNil(fakeUserDefaultsModel.optString)
        fakeUserDefaultsModel.optString = "fuga"
        XCTAssertEqual(fakeUserDefaultsModel.optString, "fuga")
        fakeUserDefaultsModel.optString = nil
        XCTAssertNil(fakeUserDefaultsModel.optString)
    }
    
    func test_Fake_URL() {
        let url = URL(string: "https://google.com")!
        XCTAssertEqual(fakeUserDefaultsModel.url, URL(fileURLWithPath: "/"))
        fakeUserDefaultsModel.url = url
        XCTAssertEqual(fakeUserDefaultsModel.url, url)
        
        XCTAssertNil(fakeUserDefaultsModel.optUrl)
        fakeUserDefaultsModel.optUrl = url
        XCTAssertEqual(fakeUserDefaultsModel.optUrl, url)
        fakeUserDefaultsModel.optUrl = nil
        XCTAssertNil(fakeUserDefaultsModel.optUrl)
    }
}

enum Color: String {
    case red
    case blue
    case yellow
}

class UserDefaultsModel {
        
    @UserDefaultsProperty(key: "key1", defaultValue: "str")
    var string: String
    
    @UserDefaultsOptionalProperty(key: "key2")
    var optString: String?
    
    @UserDefaultsProperty(key: "key3", defaultValue: [0, 1, 2])
    var array: [Int]
    @UserDefaultsOptionalProperty(key: "key4")
    var optArray: [Int]?
    
    @UserDefaultsProperty(key: "key5", defaultValue: ["k1": 0, "k2": 2])
    var dictionary: [String: Int]
    @UserDefaultsOptionalProperty(key: "key6")
    var optDictionary: [String: Int]?
    
    @UserDefaultsProperty(key: "key7", defaultValue: URL(fileURLWithPath: "/"))
    var url: URL
    @UserDefaultsOptionalProperty(key: "key8")
    var optUrl: URL?
    
    @UserDefaultsProperty(key: "key9", defaultValue: ["a", "b", "c"])
    var stringArray: [String]
    @UserDefaultsOptionalProperty(key: "key10")
    var optStringArray: [String]?
    
    @UserDefaultsProperty(key: "key11", defaultValue: "str".data(using: .utf8)!)
    var data: Data
    @UserDefaultsOptionalProperty(key: "key12")
    var optData: Data?
    
    @UserDefaultsProperty(key: "key13", defaultValue: true)
    var bool: Bool
    @UserDefaultsOptionalProperty(key: "key14")
    var optBool: Bool?
    
    @UserDefaultsProperty(key: "key15", defaultValue: 128)
    var int: Int
    @UserDefaultsOptionalProperty(key: "key16")
    var optInt: Int?
    
    @UserDefaultsProperty(key: "key17", defaultValue: 0.25)
    var float: Float
    @UserDefaultsOptionalProperty(key: "key18")
    var optFloat: Float?
    
    @UserDefaultsProperty(key: "key19", defaultValue: 0.75)
    var double: Double
    @UserDefaultsOptionalProperty(key: "key20")
    var optDouble: Double?
    
    @UserDefaultsEnumProperty(key: "key21", defaultValue: Color.red)
    var enumValue: Color
    @UserDefaultsOptionalEnumProperty(key: "key22")
    var optEnumValue: Color?
}

class FakeUserDefaultsModel {
    
    static var userDefaults = FakeUserDefaults()
    
    @UserDefaultsProperty(userDefaults: userDefaults, key: "key1", defaultValue: "str")
    var string: String
    @UserDefaultsOptionalProperty(userDefaults: userDefaults, key: "key2")
    var optString: String?
    
    @UserDefaultsProperty(userDefaults: userDefaults, key: "key3", defaultValue: [0, 1, 2])
    var array: [Int]
    @UserDefaultsOptionalProperty(userDefaults: userDefaults, key: "key4")
    var optArray: [Int]?
    
    @UserDefaultsProperty(userDefaults: userDefaults, key: "key5", defaultValue: ["k1": 0, "k2": 2])
    var dictionary: [String: Int]
    @UserDefaultsOptionalProperty(userDefaults: userDefaults, key: "key6")
    var optDictionary: [String: Int]?
    
    @UserDefaultsProperty(userDefaults: userDefaults, key: "key7", defaultValue: URL(fileURLWithPath: "/"))
    var url: URL
    @UserDefaultsOptionalProperty(userDefaults: userDefaults, key: "key8")
    var optUrl: URL?
}
