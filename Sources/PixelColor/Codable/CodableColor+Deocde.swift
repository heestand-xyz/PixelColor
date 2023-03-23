import SwiftUI

extension CodableColor {
    
    static func decode(color: Color) -> CodableColor? {
        
        if let dynamicColor = DynamicColor(rawValue: color.description) {
            return .dynamic(dynamicColor, opacity: 1.0)
        }
        
        if color.description.contains("%") {
            
            let parts = color.description.components(separatedBy: "% ")
            guard parts.count == 2 else { return nil }
            
            let percentage = Int(parts.first!) ?? 100
            let opacity = CGFloat(percentage) / 100
            
            guard let dynamicColor = DynamicColor(rawValue: String(parts.last!)) else { return nil }
            
            return .dynamic(dynamicColor, opacity: opacity)
            
        }
        
        if color.description.starts(with: "NamedColor") {
            let components = color.description.components(separatedBy: "\"")
            guard components.count >= 3 else { return nil }
            let name: String = components[1]
            #if os(macOS)
            guard let color = NSColor(named: name) else { return nil }
            #else
            guard let color = UIColor(named: name) else { return nil }
            #endif
            return .static(PixelColor(color))
        }
        
        return nil
    }
}
