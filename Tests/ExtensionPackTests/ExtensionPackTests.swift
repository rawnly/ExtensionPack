import XCTest

@testable import ExtensionPack

final class ExtensionPackTests: XCTestCase {
    func testNumericSafeString() {
        XCTAssertEqual("01", 1.safeString)
    }
    
    static var allTests = [
        ("testNumericSafeString", testNumericSafeString),
    ]
}
