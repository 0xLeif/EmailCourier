import XCTest
@testable import EmailCourier

final class EmailCourierTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Email(recipients: "me@mail.com").recipients.count, 1)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
