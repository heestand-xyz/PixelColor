#if os(macOS)
import AppKit
#else
import UIKit
#endif
import SwiftUI
import CoreGraphics

/// Pixel Color contains 4 `CGFloat` channels.
///
/// - Channels: ``red-swift.type.property``,  ``green-swift.property``,  ``blue-swift.property`` and  ``alpha``.
/// - Color conversions: ``init(hue:saturation:brightness:alpha:)``, ``hue`` and ``saturation``.
/// - Hex conversion: ``init(hex:a:)`` and ``hex``.
public struct PixelColor: Equatable, Hashable, CustomStringConvertible {
    
    public var red: CGFloat
    public var green: CGFloat
    public var blue: CGFloat
    public var alpha: CGFloat
    
    @available(*, deprecated, renamed: "red")
    public var r: CGFloat { red }
    @available(*, deprecated, renamed: "green")
    public var g: CGFloat { green }
    @available(*, deprecated, renamed: "blue")
    public var b: CGFloat { blue }
    @available(*, deprecated, renamed: "alpha")
    public var a: CGFloat { alpha }
    
    public var description: String {
        func format(_ value: CGFloat) -> String {
            "\(round(value * 1_000) / 1_000)"
        }
        return "PixelColor(red: \(format(red)), green: \(format(green)), blue: \(format(blue)), alpha: \(format(alpha))"
    }

    public var components: [CGFloat] {
        return [red, green, blue, alpha]
    }
    
    public var greyComponents: [CGFloat] {
        return [red, alpha]
    }
    
    var colorSpace: CGColorSpace {
        if saturation > 0.0 {
            return CGColorSpace(name: CGColorSpace.sRGB)!
        } else {
            return CGColorSpace(name: CGColorSpace.genericGrayGamma2_2)!
        }
    }
    
    public var monochrome: PixelColor {
        PixelColor(red: brightness, green: brightness, blue: brightness, alpha: alpha)
    }
    
    // MARK: Life Cycle
    
    public init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    public init(white: CGFloat, alpha: CGFloat = 1.0) {
        red = white
        green = white
        blue = white
        self.alpha = alpha
    }
    
    public init(red255: Int, green255: Int, blue255: Int, alpha255: Int = 255) {
        red = CGFloat(red255) / 255
        green = CGFloat(green255) / 255
        blue = CGFloat(blue255) / 255
        alpha = CGFloat(alpha255) / 255
    }
    
    #if os(iOS) || os(tvOS)
    public init(_ uiColor: UIColor) {
        let ciColor = CIColor(color: uiColor)
        red = ciColor.red
        green = ciColor.green
        blue = ciColor.blue
        alpha = ciColor.alpha
    }
    #endif

    #if os(macOS)
    public init(_ nsColor: NSColor) {
        let ciColor = CIColor(color: nsColor)
        red = ciColor?.red ?? 0.0
        green = ciColor?.green ?? 0.0
        blue = ciColor?.blue ?? 0.0
        alpha = ciColor?.alpha ?? 0.0
    }
    #endif
    
    @available(iOS 14.0, *)
    @available(tvOS 14, *)
    @available(macOS 11, *)
    public init(_ color: Color) {
        guard let cgColor: CGColor = color.cgColor else {
            guard let pixelColor = Self.decode(color: color) else {
                self = .clear
                return
            }
            self = pixelColor
            return
        }
        self.init(cgColor)
    }
    
    public init(_ cgColor: CGColor) {
        guard let components: [CGFloat] = cgColor.components else {
            self = .clear
            return
        }
        self = PixelColor(red: components.first!,
                          green: components.count == 4 ? components[1] : components.first!,
                          blue: components.count == 4 ? components[2] : components.first!,
                          alpha: components.last!)
    }
    
    public init(_ ciColor: CIColor) {
        red = ciColor.red
        green = ciColor.green
        blue = ciColor.blue
        alpha = ciColor.alpha
    }
    
    @available(*, deprecated, renamed: "init(red:green:blue:alpha:)")
    public init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1.0) {
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    // MARK: - Hue Saturaton Brightness
       
    public init(hue: CGFloat, saturation: CGFloat = 1.0, brightness: CGFloat = 1.0, alpha: CGFloat = 1.0) {
        let color = PixelColor.rgb(h: hue, s: saturation, v: brightness)
        red = color.r
        green = color.g
        blue = color.b
        self.alpha = alpha
    }
    
    // MARK: - Hex
    
    public var hex: String {
        let hexInt: Int = (Int)(CGFloat(red)*255)<<16 | (Int)(CGFloat(green)*255)<<8 | (Int)(CGFloat(blue)*255)<<0
        return String(format:"%06x", hexInt).uppercased()
    }
    
    /// Create a Pixel Color from a hex like orange: `#ff80000`
    public init(hex: String, a: CGFloat = 1) {
        if hex.lowercased() == "f" {
            red = 1.0
            green = 1.0
            blue = 1.0
            alpha = 1.0
            return
        } else if hex.lowercased() == "0" {
            red = 0.0
            green = 0.0
            blue = 0.0
            alpha = 1.0
            return
        }
        guard hex != "" else {
            red = 0.0
            green = 0.0
            blue = 0.0
            alpha = a
            return
        }
        var hex = hex
        func sub(txt: String, range: CountableRange<Int>) -> String {
            let start: String.Index = txt.index(txt.startIndex, offsetBy: range.lowerBound)
            let end: String.Index = txt.index(txt.startIndex, offsetBy: range.upperBound)
            return String(txt[start..<end])
        }
        if sub(txt: hex, range: 0..<1) == "#" {
            if hex.count == 4 {
                hex = sub(txt: hex, range: 1..<4)
            } else {
                hex = sub(txt: hex, range: 1..<7)
            }
        }
        if hex.count == 3 {
            let r = sub(txt: hex, range: 0..<1)
            let g = sub(txt: hex, range: 1..<2)
            let b = sub(txt: hex, range: 2..<3)
            hex = r + r + g + g + b + b
        }
        var hexInt: UInt64 = 0
        let scanner: Scanner = Scanner(string: hex)
        scanner.scanHexInt64(&hexInt)
        red = CGFloat((hexInt & 0xff0000) >> 16) / 255.0
        green = CGFloat((hexInt & 0xff00) >> 8) / 255.0
        blue = CGFloat((hexInt & 0xff) >> 0) / 255.0
        alpha = a
    }

    
    // MARK: - Channel
    
    public init(channel: Channel) {
        red = 0
        green = 0
        blue = 0
        alpha = 0
        switch channel {
        case .red:
            red = 1
        case .green:
            green = 1
        case .blue:
            blue = 1
        case .alpha:
            alpha = 1
        }
    }
}
