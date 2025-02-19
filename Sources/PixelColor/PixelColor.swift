#if os(macOS)
import AppKit
#else
import UIKit
#endif
import SwiftUI
import CoreGraphics

/// Pixel Color with `4` `CGFloat` channels.
///
/// - Channels: ``red-swift.property``,  ``green-swift.property``,  ``blue-swift.property`` and  ``opacity``.
/// - Color conversions: ``init(hue:saturation:brightness:alpha:)``, ``hue`` and ``saturation``.
/// - Hex conversion: ``init(hex:a:)`` and ``hex``.
public struct PixelColor: Equatable, CustomStringConvertible, Sendable {
    
    public var red: CGFloat
    public var green: CGFloat
    public var blue: CGFloat
    public var opacity: CGFloat

    /// Opacity
    public var alpha: CGFloat {
        get {
            opacity
        }
        set {
            opacity = newValue
        }
    }
    
    public var description: String {
        func format(_ value: CGFloat) -> String {
            "\(round(value * 1_000) / 1_000)"
        }
        return "PixelColor(red: \(format(red)), green: \(format(green)), blue: \(format(blue)), opacity: \(format(opacity)))"
    }

    
    public var components: [CGFloat] {
        return [red, green, blue, opacity]
    }
    
    /// Red and alpha.
    public var greyComponents: [CGFloat] {
        return [red, opacity]
    }
    
    public var monochrome: PixelColor {
        PixelColor(red: brightness, green: brightness, blue: brightness, opacity: opacity)
    }
    
    // MARK: Life Cycle
    
    @available(*, deprecated, renamed: "init(red:green:blue:opacity:)")
    public init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
    
    public init(red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat = 1.0) {
        self.red = red
        self.green = green
        self.blue = blue
        self.opacity = opacity
    }
    
    @available(*, deprecated, renamed: "init(white:opacity:)")
    public init(white: CGFloat, alpha: CGFloat) {
        self.init(white: white, opacity: alpha)
    }
    
    public init(white: CGFloat, opacity: CGFloat = 1.0) {
        red = white
        green = white
        blue = white
        self.opacity = opacity
    }
    
    @available(*, deprecated, renamed: "init(red255:green255:blue255:opacity255:)")
    public init(red255: Int, green255: Int, blue255: Int, alpha255: Int = 255) {
        self.init(
            red255: red255 < 0 ? 0 : red255 > 255 ? 255 : UInt8(red255),
            green255: green255 < 0 ? 0 : green255 > 255 ? 255 : UInt8(green255),
            blue255: blue255 < 0 ? 0 : blue255 > 255 ? 255 : UInt8(blue255),
            opacity255: alpha255 < 0 ? 0 : alpha255 > 255 ? 255 : UInt8(alpha255)
        )
    }
    
    public init(red255: UInt8, green255: UInt8, blue255: UInt8, opacity255: UInt8 = 255) {
        red = CGFloat(red255) / 255
        green = CGFloat(green255) / 255
        blue = CGFloat(blue255) / 255
        opacity = CGFloat(opacity255) / 255
    }
    
    #if os(iOS) || os(tvOS) || os(visionOS)
    public init(_ uiColor: UIColor) {
        let ciColor = CIColor(color: uiColor)
        red = ciColor.red
        green = ciColor.green
        blue = ciColor.blue
        opacity = ciColor.alpha
    }
    #endif

    #if os(macOS)
    public init(_ nsColor: NSColor) {
        let ciColor = CIColor(color: nsColor)
        red = ciColor?.red ?? 0.0
        green = ciColor?.green ?? 0.0
        blue = ciColor?.blue ?? 0.0
        opacity = ciColor?.alpha ?? 0.0
    }
    #endif
    
    public init(_ color: Color, convertToColorSpace: CGColorSpace? = nil) {
        if #available(iOS 17.0, tvOS 17.0, macOS 14.0, visionOS 1.0, *) {
            let cgColor: CGColor = color.resolve(in: .init()).cgColor
            self.init(cgColor, convertToColorSpace: convertToColorSpace)
        } else {
            guard let cgColor: CGColor = color.cgColor else {
                guard let pixelColor = Self.decode(color: color) else {
                    self = .clear
                    return
                }
                self = pixelColor
                return
            }
            self.init(cgColor, convertToColorSpace: convertToColorSpace)
        }
    }
    
    public init(_ cgColor: CGColor, convertToColorSpace: CGColorSpace? = nil) {
        
        var cgColor: CGColor = cgColor
        
        if let convertToColorSpace: CGColorSpace {
            if cgColor.colorSpace != convertToColorSpace {
                if let convertedCGColor: CGColor = cgColor.converted(to: convertToColorSpace, intent: .defaultIntent, options: nil) {
                    cgColor = convertedCGColor
                }
            }
        }
        
        guard let components: [CGFloat] = cgColor.components else {
            self = .clear
            return
        }
        
        red = components.first!
        green = components.count == 4 ? components[1] : components.first!
        blue = components.count == 4 ? components[2] : components.first!
        opacity = components.last!
    }
    
    public init(_ ciColor: CIColor) {
        red = ciColor.red
        green = ciColor.green
        blue = ciColor.blue
        opacity = ciColor.alpha
    }
    
    // MARK: - Hue Saturation Brightness
    
    @available(*, deprecated, renamed: "init(hue:saturation:brightness:opacity:)")
    public init(hue: CGFloat, saturation: CGFloat = 1.0, brightness: CGFloat = 1.0, alpha: CGFloat) {
        self.init(hue: hue, saturation: saturation, brightness: brightness, opacity: alpha)
    }
    
    public init(hue: CGFloat, saturation: CGFloat = 1.0, brightness: CGFloat = 1.0, opacity: CGFloat = 1.0) {
        let color = PixelColor.rgb(h: hue, s: saturation, v: brightness)
        red = color.r
        green = color.g
        blue = color.b
        self.opacity = opacity
    }
    
    // MARK: - Hex
    
    public var hex: String {
        let hexInt: Int = (Int)(CGFloat(red)*255)<<16 | (Int)(CGFloat(green)*255)<<8 | (Int)(CGFloat(blue)*255)<<0
        return String(format:"%06x", hexInt).uppercased()
    }
    
    public var hexWithOpacity: String {
        let hexInt: Int = (Int)(CGFloat(red)*255)<<24 | (Int)(CGFloat(green)*255)<<16 | (Int)(CGFloat(blue)*255)<<8 | (Int)(CGFloat(opacity)*255)
        return String(format:"%08x", hexInt).uppercased()
    }
    
    @available(*, deprecated, renamed: "init(hex:opacity:)")
    public init?(hex: String, a: CGFloat) {
        self.init(hex: hex, opacity: a)
    }
    
    /// Create a Pixel Color from a hex like orange: `#ff8000`
    public init?(hex: String, opacity: CGFloat = 1.0) {
        guard hex != "" else {
            return nil
        }
        if hex.lowercased() == "f" {
            red = 1.0
            green = 1.0
            blue = 1.0
            self.opacity = opacity
            return
        } else if hex.lowercased() == "0" {
            red = 0.0
            green = 0.0
            blue = 0.0
            self.opacity = opacity
            return
        }
        var hex = hex
        func sub(txt: String, range: CountableRange<Int>) -> String {
            let start: String.Index = txt.index(txt.startIndex, offsetBy: range.lowerBound)
            let end: String.Index = txt.index(txt.startIndex, offsetBy: range.upperBound)
            return String(txt[start..<end])
        }
        if hex.hasPrefix("#") {
            hex = String(hex.dropFirst())
        }
        if hex.count == 1 {
            hex = String(repeating: hex, count: 6)
        } else if hex.count == 2 {
            let a = sub(txt: hex, range: 0..<1)
            let b = sub(txt: hex, range: 1..<2)
            hex = a + b + a + b + a + b
        } else if hex.count == 3 {
            let r = sub(txt: hex, range: 0..<1)
            let g = sub(txt: hex, range: 1..<2)
            let b = sub(txt: hex, range: 2..<3)
            hex = r + r + g + g + b + b
        } else if hex.count == 8 {
            hex = sub(txt: hex, range: 0..<6)
        }
        if hex.count != 6 {
            return nil
        }
        var hexInt: UInt64 = 0
        let scanner: Scanner = Scanner(string: hex)
        scanner.scanHexInt64(&hexInt)
        red = CGFloat((hexInt & 0xFF0000) >> 16) / 255.0
        green = CGFloat((hexInt & 0x00FF00) >> 8) / 255.0
        blue = CGFloat((hexInt & 0x0000FF) >> 0) / 255.0
        self.opacity = opacity
    }
    
    /// Create a Pixel Color from a hex like translucent orange: `#ff800080`
    public init?(hexWithOpacity: String) {
        var hex: String = hexWithOpacity
        guard hex != "" else {
            return nil
        }
        if hex.lowercased() == "f" {
            red = 1.0
            green = 1.0
            blue = 1.0
            opacity = 1.0
            return
        } else if hex.lowercased() == "0" {
            red = 0.0
            green = 0.0
            blue = 0.0
            opacity = 0.0
            return
        }
        func sub(txt: String, range: CountableRange<Int>) -> String {
            let start: String.Index = txt.index(txt.startIndex, offsetBy: range.lowerBound)
            let end: String.Index = txt.index(txt.startIndex, offsetBy: range.upperBound)
            return String(txt[start..<end])
        }
        if hex.hasPrefix("#") {
            hex = String(hex.dropFirst())
        }
        if hex.count == 1 {
            hex = String(repeating: hex, count: 8)
        } else if hex.count == 2 {
            let a = sub(txt: hex, range: 0..<1)
            let b = sub(txt: hex, range: 1..<2)
            hex = a + b + a + b + a + b + a + b
        } else if hex.count == 3 {
            let r = sub(txt: hex, range: 0..<1)
            let g = sub(txt: hex, range: 1..<2)
            let b = sub(txt: hex, range: 2..<3)
            hex = r + r + g + g + b + b + "FF"
        } else if hex.count == 4 {
            let r = sub(txt: hex, range: 0..<1)
            let g = sub(txt: hex, range: 1..<2)
            let b = sub(txt: hex, range: 2..<3)
            let a = sub(txt: hex, range: 3..<4)
            hex = r + r + g + g + b + b + a + a
        } else if hex.count == 6 {
            hex = sub(txt: hex, range: 0..<6) + "FF"
        } else if hex.count == 8 {
            hex = sub(txt: hex, range: 0..<8)
        }
        if hex.count != 8 {
            return nil
        }
        var hexInt: UInt64 = 0
        let scanner: Scanner = Scanner(string: hex)
        scanner.scanHexInt64(&hexInt)
        red = CGFloat((hexInt & 0xFF000000) >> 24) / 255.0
        green = CGFloat((hexInt & 0x00FF0000) >> 16) / 255.0
        blue = CGFloat((hexInt & 0x0000FF00) >> 8) / 255.0
        opacity = CGFloat(hexInt & 0x000000FF) / 255.0
    }
    
    // MARK: - Channel
    
    public init(channel: Channel) {
        red = 0
        green = 0
        blue = 0
        opacity = 0
        switch channel {
        case .red:
            red = 1
        case .green:
            green = 1
        case .blue:
            blue = 1
        case .alpha:
            opacity = 1
        }
    }
}
