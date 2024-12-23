//
//  File.swift
//  
//
//  Created by Anton Heestand on 2021-05-11.
//

import Foundation
import CoreGraphics
import SwiftUI

extension PixelColor {
    
    // MARK: Opacity
    
    public func opacity(_ opacity: CGFloat) -> PixelColor {
        PixelColor(red: red, green: green, blue: blue, opacity: self.opacity * opacity)
    }
    
    @available(*, deprecated, renamed: "withOpacity(of:)")
    public func withAlpha(of alpha: CGFloat) -> PixelColor {
        return PixelColor(red: red, green: green, blue: blue, opacity: alpha)
    }
    
    public func withOpacity(of opacity: CGFloat) -> PixelColor {
        PixelColor(red: red, green: green, blue: blue, opacity: opacity)
    }
    
    // MARK: Hue
    
    @available(*, deprecated, renamed: "shiftHue(by:)")
    public func withShiftedHue(by hueShift: CGFloat) -> PixelColor {
        shiftHue(by: hueShift)
    }
    
    /// Replace the hue.
    public func withHue(of hue: CGFloat) -> PixelColor {
        return PixelColor(hue: hue, saturation: saturation, brightness: brightness)
    }
    
    /// Replace the hue with an `Angle`.
    public func withHue(of hue: Angle) -> PixelColor {
        return PixelColor(hue: hue.degrees / 360, saturation: saturation, brightness: brightness)
    }
    
    /// Offset the hue.
    ///
    /// Hue is between `0.0` and `1.0`.
    public func shiftHue(by hueShift: CGFloat) -> PixelColor {
        return PixelColor(
            hue: (hue + hueShift).truncatingRemainder(dividingBy: 1.0),
            saturation: saturation,
            brightness: brightness
        )
    }
    
    /// Offset the hue by an `Angle`.
    public func shiftHue(by hueShift: Angle) -> PixelColor {
        return PixelColor(
            hue: (hue + (hueShift.degrees / 360)).truncatingRemainder(dividingBy: 1.0),
            saturation: saturation,
            brightness: brightness
        )
    }
    
    // MARK: Saturation
    
    /// Multiply the current saturation.
    public func saturate(_ saturation: CGFloat) -> PixelColor {
        return PixelColor(hue: hue, saturation: self.saturation * saturation, brightness: brightness)
    }
    
    /// Replace the saturation.
    public func withSaturation(of saturation: CGFloat) -> PixelColor {
        return PixelColor(hue: hue, saturation: saturation, brightness: brightness)
    }
    
    // MARK: Brightness
    
    /// Multiply the current brightness.
    public func brighten(by brightness: CGFloat) -> PixelColor {
        return PixelColor(hue: hue, saturation: saturation, brightness: self.brightness * brightness)
    }
    
    /// Add to the current brightness.
    public func expose(by exposure: CGFloat) -> PixelColor {
        return PixelColor(hue: hue, saturation: saturation, brightness: self.brightness + exposure)
    }
    
    /// Replace the brightness.
    public func withBrightness(of brightness: CGFloat) -> PixelColor {
        return PixelColor(hue: hue, saturation: saturation, brightness: brightness)
    }
}
