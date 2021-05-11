//
//  File.swift
//  
//
//  Created by Anton Heestand on 2021-05-11.
//

import Foundation
import CoreGraphics

extension PixelColor {
    
    public func withAlpha(of alpha: CGFloat) -> PixelColor {
        return PixelColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public func withHue(of hue: CGFloat) -> PixelColor {
        return PixelColor(hue: hue, saturation: saturation, brightness: brightness)
    }
    
    public func withSaturation(of saturation: CGFloat) -> PixelColor {
        return PixelColor(hue: hue, saturation: saturation, brightness: brightness)
    }
    
    public func withBrightness(of brightness: CGFloat) -> PixelColor {
        return PixelColor(hue: hue, saturation: saturation, brightness: brightness)
    }
    
    public func withShiftedHue(by hueShift: CGFloat) -> PixelColor {
        return PixelColor(hue: (hue + hueShift).remainder(dividingBy: 1.0), saturation: saturation, brightness: brightness)
    }
}
