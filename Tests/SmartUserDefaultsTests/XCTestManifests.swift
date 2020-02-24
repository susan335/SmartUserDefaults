import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SmartUserDefaultsTests.allTests),
    ]
}
#endif
