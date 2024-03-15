import XCTest
@testable import PixelColor

final class ConsistencyTests: XCTestCase {
    
    func testConsistency() throws {
        
        for dynamicColor in DynamicColor.allCases {
            let color = dynamicColor.pixelColor.color
            let pixelColor = PixelColor(color)
            XCTAssertEqual(dynamicColor.pixelColor, pixelColor)
        }
    }
}
