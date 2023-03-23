import CoreGraphics

public enum CodableColor: Codable {
    case `static`(PixelColor)
    case dynamic(DynamicColor, opacity: CGFloat)
}

extension CodableColor {
    
    public var pixelColor: PixelColor {
        switch self {
        case .static(let pixelColor):
            return pixelColor
        case .dynamic(let dynamicColor, let opacity):
            return dynamicColor.pixelColor.opacity(opacity)
        }
    }
}
