//
//  Created by Anton Heestand on 2022-04-03.
//

import CoreGraphics

public extension PixelColor {
    
    static func + (lhs: PixelColor, rhs: PixelColor) -> PixelColor {
        
        PixelColor(red: lhs.red + rhs.red,
                   green: lhs.green + rhs.green,
                   blue: lhs.blue + rhs.blue,
                   alpha: lhs.alpha + rhs.alpha)
    }
    
    static func - (lhs: PixelColor, rhs: PixelColor) -> PixelColor {
        
        PixelColor(red: lhs.red - rhs.red,
                   green: lhs.green - rhs.green,
                   blue: lhs.blue - rhs.blue,
                   alpha: lhs.alpha - rhs.alpha)
    }
    
    static func * (lhs: PixelColor, rhs: PixelColor) -> PixelColor {
        
        PixelColor(red: lhs.red * rhs.red,
                   green: lhs.green * rhs.green,
                   blue: lhs.blue * rhs.blue,
                   alpha: lhs.alpha * rhs.alpha)
    }
    
    static func / (lhs: PixelColor, rhs: PixelColor) -> PixelColor {
        
        PixelColor(red: (rhs.red > 0.0) ? (lhs.red / rhs.red) : 1.0,
                   green: (rhs.green > 0.0) ? (lhs.green / rhs.green) : 1.0,
                   blue: (rhs.blue > 0.0) ? (lhs.blue / rhs.blue) : 1.0,
                   alpha: (rhs.alpha > 0.0) ? (lhs.alpha / rhs.alpha) : 1.0)
    }
}

public extension PixelColor {
    
    static func + (lhs: PixelColor, rhs: CGFloat) -> PixelColor {
        
        PixelColor(red: lhs.red + rhs,
                   green: lhs.green + rhs,
                   blue: lhs.blue + rhs,
                   alpha: lhs.alpha + rhs)
    }
    
    static func - (lhs: PixelColor, rhs: CGFloat) -> PixelColor {
        
        PixelColor(red: lhs.red - rhs,
                   green: lhs.green - rhs,
                   blue: lhs.blue - rhs,
                   alpha: lhs.alpha - rhs)
    }
    
    static func * (lhs: PixelColor, rhs: CGFloat) -> PixelColor {
        
        PixelColor(red: lhs.red * rhs,
                   green: lhs.green * rhs,
                   blue: lhs.blue * rhs,
                   alpha: lhs.alpha * rhs)
    }
    
    static func / (lhs: PixelColor, rhs: CGFloat) -> PixelColor {
        
        PixelColor(red: (rhs > 0.0) ? (lhs.red / rhs) : 1.0,
                   green: (rhs > 0.0) ? (lhs.green / rhs) : 1.0,
                   blue: (rhs > 0.0) ? (lhs.blue / rhs) : 1.0,
                   alpha: (rhs > 0.0) ? (lhs.alpha / rhs) : 1.0)
    }
}

public extension PixelColor {
    
    static func + (lhs: CGFloat, rhs: PixelColor) -> PixelColor {
        
        PixelColor(red: lhs + rhs.red,
                   green: lhs + rhs.green,
                   blue: lhs + rhs.blue,
                   alpha: lhs + rhs.alpha)
    }
    
    static func - (lhs: CGFloat, rhs: PixelColor) -> PixelColor {
        
        PixelColor(red: lhs - rhs.red,
                   green: lhs - rhs.green,
                   blue: lhs - rhs.blue,
                   alpha: lhs - rhs.alpha)
    }
    
    static func * (lhs: CGFloat, rhs: PixelColor) -> PixelColor {
        
        PixelColor(red: lhs * rhs.red,
                   green: lhs * rhs.green,
                   blue: lhs * rhs.blue,
                   alpha: lhs * rhs.alpha)
    }
    
    static func / (lhs: CGFloat, rhs: PixelColor) -> PixelColor {
        
        PixelColor(red: (rhs.red > 0.0) ? (lhs / rhs.red) : 1.0,
                   green: (rhs.green > 0.0) ? (lhs / rhs.green) : 1.0,
                   blue: (rhs.blue > 0.0) ? (lhs / rhs.blue) : 1.0,
                   alpha: (rhs.alpha > 0.0) ? (lhs / rhs.alpha) : 1.0)
    }
}

// MARK: - Modify

public extension PixelColor {
    
    static func += (lhs: inout PixelColor, rhs: PixelColor) {
        
        lhs = PixelColor(red: lhs.red + rhs.red,
                         green: lhs.green + rhs.green,
                         blue: lhs.blue + rhs.blue,
                         alpha: lhs.alpha + rhs.alpha)
    }
    
    static func -= (lhs: inout PixelColor, rhs: PixelColor) {
        
        lhs = PixelColor(red: lhs.red - rhs.red,
                         green: lhs.green - rhs.green,
                         blue: lhs.blue - rhs.blue,
                         alpha: lhs.alpha - rhs.alpha)
    }
    
    static func *= (lhs: inout PixelColor, rhs: PixelColor) {
        
        lhs = PixelColor(red: lhs.red * rhs.red,
                         green: lhs.green * rhs.green,
                         blue: lhs.blue * rhs.blue,
                         alpha: lhs.alpha * rhs.alpha)
    }
    
    static func /= (lhs: inout PixelColor, rhs: PixelColor) {
        
        lhs = PixelColor(red: (rhs.red > 0.0) ? (lhs.red / rhs.red) : 1.0,
                         green: (rhs.green > 0.0) ? (lhs.green / rhs.green) : 1.0,
                         blue: (rhs.blue > 0.0) ? (lhs.blue / rhs.blue) : 1.0,
                         alpha: (rhs.alpha > 0.0) ? (lhs.alpha / rhs.alpha) : 1.0)
    }
}

public extension PixelColor {
    
    static func += (lhs: inout PixelColor, rhs: CGFloat) {
        
        lhs = PixelColor(red: lhs.red + rhs,
                         green: lhs.green + rhs,
                         blue: lhs.blue + rhs,
                         alpha: lhs.alpha + rhs)
    }
    
    static func -= (lhs: inout PixelColor, rhs: CGFloat) {
        
        lhs = PixelColor(red: lhs.red - rhs,
                         green: lhs.green - rhs,
                         blue: lhs.blue - rhs,
                         alpha: lhs.alpha - rhs)
    }
    
    static func *= (lhs: inout PixelColor, rhs: CGFloat) {
        
        lhs = PixelColor(red: lhs.red * rhs,
                         green: lhs.green * rhs,
                         blue: lhs.blue * rhs,
                         alpha: lhs.alpha * rhs)
    }
    
    static func /= (lhs: inout PixelColor, rhs: CGFloat) {
        
        lhs = PixelColor(red: (rhs > 0.0) ? (lhs.red / rhs) : 1.0,
                         green: (rhs > 0.0) ? (lhs.green / rhs) : 1.0,
                         blue: (rhs > 0.0) ? (lhs.blue / rhs) : 1.0,
                         alpha: (rhs > 0.0) ? (lhs.alpha / rhs) : 1.0)
    }
}
