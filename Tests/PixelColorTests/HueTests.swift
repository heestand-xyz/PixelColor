import XCTest
@testable import PixelColor

final class LetsTest: XCTestCase {
    
    func testHue() throws {
        
        var currentHue: CGFloat = 0.0
        var currentColor: DynamicColor?
        
        for dynamicColor in DynamicColor.allCases {
            if [.primary, .gray, .brown].contains(dynamicColor) { continue }
            let hue = dynamicColor.pixelColor.hue
            XCTAssertLessThan(currentHue, hue, "\(currentColor?.rawValue ?? "nil") < \(dynamicColor.rawValue)")
            currentHue = hue
            currentColor = dynamicColor
        }
    }
}
