import XCTest
@testable import Tracking

final class TrackingTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Tracking().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
