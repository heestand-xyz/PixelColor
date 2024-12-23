//
//  Created by Anton Heestand on 2022-04-03.
//

import CoreGraphics

public extension PixelColor {
    
    static prefix func ! (color: PixelColor) -> PixelColor {
        return PixelColor(
            red: 1.0 - color.red,
            green: 1.0 - color.green,
            blue: 1.0 - color.blue,
            opacity: color.opacity
        )
    }
    
    static func + (lhs: PixelColor, rhs: PixelColor) -> PixelColor {
        
        PixelColor(red: lhs.red + rhs.red,
                   green: lhs.green + rhs.green,
                   blue: lhs.blue + rhs.blue,
                   opacity: lhs.opacity + rhs.opacity)
    }
    
    static func - (lhs: PixelColor, rhs: PixelColor) -> PixelColor {
        
        PixelColor(red: lhs.red - rhs.red,
                   green: lhs.green - rhs.green,
                   blue: lhs.blue - rhs.blue,
                   opacity: lhs.opacity - rhs.opacity)
    }
    
    static func * (lhs: PixelColor, rhs: PixelColor) -> PixelColor {
        
        PixelColor(red: lhs.red * rhs.red,
                   green: lhs.green * rhs.green,
                   blue: lhs.blue * rhs.blue,
                   opacity: lhs.opacity * rhs.opacity)
    }
    
    static func / (lhs: PixelColor, rhs: PixelColor) -> PixelColor {
        
        PixelColor(red: (rhs.red > 0.0) ? (lhs.red / rhs.red) : 0.0,
                   green: (rhs.green > 0.0) ? (lhs.green / rhs.green) : 0.0,
                   blue: (rhs.blue > 0.0) ? (lhs.blue / rhs.blue) : 0.0,
                   opacity: (rhs.opacity > 0.0) ? (lhs.opacity / rhs.opacity) : 0.0)
    }
}

public extension PixelColor {
    
    static func + (lhs: PixelColor, rhs: CGFloat) -> PixelColor {
        
        PixelColor(red: lhs.red + rhs,
                   green: lhs.green + rhs,
                   blue: lhs.blue + rhs,
                   opacity: lhs.opacity + rhs)
    }
    
    static func - (lhs: PixelColor, rhs: CGFloat) -> PixelColor {
        
        PixelColor(red: lhs.red - rhs,
                   green: lhs.green - rhs,
                   blue: lhs.blue - rhs,
                   opacity: lhs.opacity - rhs)
    }
    
    static func * (lhs: PixelColor, rhs: CGFloat) -> PixelColor {
        
        PixelColor(red: lhs.red * rhs,
                   green: lhs.green * rhs,
                   blue: lhs.blue * rhs,
                   opacity: lhs.opacity * rhs)
    }
    
    static func / (lhs: PixelColor, rhs: CGFloat) -> PixelColor {
        
        PixelColor(red: (rhs > 0.0) ? (lhs.red / rhs) : 0.0,
                   green: (rhs > 0.0) ? (lhs.green / rhs) : 0.0,
                   blue: (rhs > 0.0) ? (lhs.blue / rhs) : 0.0,
                   opacity: (rhs > 0.0) ? (lhs.opacity / rhs) : 0.0)
    }
}

public extension PixelColor {
    
    static func + (lhs: CGFloat, rhs: PixelColor) -> PixelColor {
        
        PixelColor(red: lhs + rhs.red,
                   green: lhs + rhs.green,
                   blue: lhs + rhs.blue,
                   opacity: lhs + rhs.opacity)
    }
    
    static func - (lhs: CGFloat, rhs: PixelColor) -> PixelColor {
        
        PixelColor(red: lhs - rhs.red,
                   green: lhs - rhs.green,
                   blue: lhs - rhs.blue,
                   opacity: lhs - rhs.opacity)
    }
    
    static func * (lhs: CGFloat, rhs: PixelColor) -> PixelColor {
        
        PixelColor(red: lhs * rhs.red,
                   green: lhs * rhs.green,
                   blue: lhs * rhs.blue,
                   opacity: lhs * rhs.opacity)
    }
    
    static func / (lhs: CGFloat, rhs: PixelColor) -> PixelColor {
        
        PixelColor(red: (rhs.red > 0.0) ? (lhs / rhs.red) : 0.0,
                   green: (rhs.green > 0.0) ? (lhs / rhs.green) : 0.0,
                   blue: (rhs.blue > 0.0) ? (lhs / rhs.blue) : 0.0,
                   opacity: (rhs.opacity > 0.0) ? (lhs / rhs.opacity) : 0.0)
    }
}

// MARK: - Modify

public extension PixelColor {
    
    static func += (lhs: inout PixelColor, rhs: PixelColor) {
        
        lhs = PixelColor(red: lhs.red + rhs.red,
                         green: lhs.green + rhs.green,
                         blue: lhs.blue + rhs.blue,
                         opacity: lhs.opacity + rhs.opacity)
    }
    
    static func -= (lhs: inout PixelColor, rhs: PixelColor) {
        
        lhs = PixelColor(red: lhs.red - rhs.red,
                         green: lhs.green - rhs.green,
                         blue: lhs.blue - rhs.blue,
                         opacity: lhs.opacity - rhs.opacity)
    }
    
    static func *= (lhs: inout PixelColor, rhs: PixelColor) {
        
        lhs = PixelColor(red: lhs.red * rhs.red,
                         green: lhs.green * rhs.green,
                         blue: lhs.blue * rhs.blue,
                         opacity: lhs.opacity * rhs.opacity)
    }
    
    static func /= (lhs: inout PixelColor, rhs: PixelColor) {
        
        lhs = PixelColor(red: (rhs.red > 0.0) ? (lhs.red / rhs.red) : 0.0,
                         green: (rhs.green > 0.0) ? (lhs.green / rhs.green) : 0.0,
                         blue: (rhs.blue > 0.0) ? (lhs.blue / rhs.blue) : 0.0,
                         opacity: (rhs.opacity > 0.0) ? (lhs.opacity / rhs.opacity) : 0.0)
    }
}

public extension PixelColor {
    
    static func += (lhs: inout PixelColor, rhs: CGFloat) {
        
        lhs = PixelColor(red: lhs.red + rhs,
                         green: lhs.green + rhs,
                         blue: lhs.blue + rhs,
                         opacity: lhs.opacity + rhs)
    }
    
    static func -= (lhs: inout PixelColor, rhs: CGFloat) {
        
        lhs = PixelColor(red: lhs.red - rhs,
                         green: lhs.green - rhs,
                         blue: lhs.blue - rhs,
                         opacity: lhs.opacity - rhs)
    }
    
    static func *= (lhs: inout PixelColor, rhs: CGFloat) {
        
        lhs = PixelColor(red: lhs.red * rhs,
                         green: lhs.green * rhs,
                         blue: lhs.blue * rhs,
                         opacity: lhs.opacity * rhs)
    }
    
    static func /= (lhs: inout PixelColor, rhs: CGFloat) {
        
        lhs = PixelColor(red: (rhs > 0.0) ? (lhs.red / rhs) : 0.0,
                         green: (rhs > 0.0) ? (lhs.green / rhs) : 0.0,
                         blue: (rhs > 0.0) ? (lhs.blue / rhs) : 0.0,
                         opacity: (rhs > 0.0) ? (lhs.opacity / rhs) : 0.0)
    }
}
