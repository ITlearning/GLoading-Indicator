import XCTest
@testable import GLoading_Indicator

final class GLoading_IndicatorTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        //XCTAssertEqual(GLoading_Indicator().text, "Hello, World!")
        
        GLoading_Indicator.instance.show()
    }
}
