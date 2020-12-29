import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Universe_Docs_WebTests.allTests),
    ]
}
#endif