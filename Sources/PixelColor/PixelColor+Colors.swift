//
//  File.swift
//
//
//  Created by Anton Heestand on 2021-05-11.
//

#if os(macOS)
import AppKit
#else
import UIKit
#endif
import SwiftUI

extension PixelColor {
    
    /// White in dark mode and black in light mode.
    @MainActor
    public static var primary: PixelColor {
        switch Self.appearance {
        case .dark: return .white
        case .light: return .black
        }
    }
    
    /// Black in dark mode and white in light mode.
    @MainActor
    public static var background: PixelColor {
        switch Self.appearance {
        case .dark: return .black
        case .light: return .white
        }
    }
    
    /// Transparent color. `#000000FF`
    public static let clear: PixelColor = .init(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.0)
    /// Transparent "white" color. `#FFFFFFFF`
    ///
    /// Useful when blending from white to transparent in a gradient.
    public static let clearWhite: PixelColor = .init(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)
    
    /// `#FFFFFF`
    public static let white: PixelColor = .init(white: 1.0)
    /// `#000000`
    public static let black: PixelColor = .init(white: 0.0)
    
    /// `50%` white.
    public static let rawGray: PixelColor = .init(white: 0.5)
    /// `#FF0000`
    public static let rawRed: PixelColor = .init(red: 1.0, green: 0.0, blue: 0.0)
    /// `#FFFF00`
    public static let rawYellow: PixelColor = .init(red: 1.0, green: 1.0, blue: 0.0)
    /// `#00FF00`
    public static let rawGreen: PixelColor = .init(red: 0.0, green: 1.0, blue: 0.0)
    /// `#00FFFF`
    public static let rawCyan: PixelColor = .init(red: 0.0, green: 1.0, blue: 1.0)
    /// `#0000FF`
    public static let rawBlue: PixelColor = .init(red: 0.0, green: 0.0, blue: 1.0)
    /// `#FF00FF`
    public static let rawMagenta: PixelColor = .init(red: 1.0, green: 0.0, blue: 1.0)
    
    @available(*, deprecated, renamed: "brightness(_:opacity:)")
    public static func brightness(_ brightness: CGFloat, alpha: CGFloat) -> PixelColor {
        self.brightness(brightness, opacity: alpha)
    }
    
    public static func brightness(_ brightness: CGFloat, opacity: CGFloat = 1.0) -> PixelColor {
        PixelColor(hue: 0.0, saturation: 0.0, brightness: brightness, opacity: opacity)
    }
    
    @available(*, deprecated, renamed: "hue(_:opacity:)")
    public static func hue(_ hue: CGFloat, alpha: CGFloat) -> PixelColor {
        self.hue(hue, opacity: alpha)
    }
    
    public static func hue(_ hue: CGFloat, opacity: CGFloat = 1.0) -> PixelColor {
        PixelColor(hue: hue, saturation: 1.0, brightness: 1.0, opacity: opacity)
    }
}

extension PixelColor {
    
    public static var gray: PixelColor {
#if os(macOS)
        PixelColor(NSColor.systemGray)
#else
        PixelColor(UIColor.systemGray)
#endif
    }
    
    public static var red: PixelColor{
#if os(macOS)
        PixelColor(NSColor.systemRed)
#else
        PixelColor(UIColor.systemRed)
#endif
    }
    
    public static var green: PixelColor{
#if os(macOS)
        PixelColor(NSColor.systemGreen)
#else
        PixelColor(UIColor.systemGreen)
#endif
    }
    
    public static var blue: PixelColor {
#if os(macOS)
        PixelColor(NSColor.systemBlue)
#else
        PixelColor(UIColor.systemBlue)
#endif
    }
    
    public static var indigo: PixelColor{
#if os(macOS)
        PixelColor(NSColor.systemIndigo)
#else
        PixelColor(UIColor.systemIndigo)
#endif
    }
    
    public static var orange: PixelColor{
#if os(macOS)
        PixelColor(NSColor.systemOrange)
#else
        PixelColor(UIColor.systemOrange)
#endif
    }
    
    public static var pink: PixelColor{
#if os(macOS)
        PixelColor(NSColor.systemPink)
#else
        PixelColor(UIColor.systemPink)
#endif
    }
    
    public static var purple: PixelColor{
#if os(macOS)
        PixelColor(NSColor.systemPurple)
#else
        PixelColor(UIColor.systemPurple)
#endif
    }
    
    public static var teal: PixelColor{
#if os(macOS)
        PixelColor(NSColor.systemTeal)
#else
        PixelColor(UIColor.systemTeal)
#endif
    }
    
    public static var yellow: PixelColor{
#if os(macOS)
        PixelColor(NSColor.systemYellow)
#else
        PixelColor(UIColor.systemYellow)
#endif
    }
    
    public static var brown: PixelColor{
#if os(macOS)
        PixelColor(NSColor.systemBrown)
#else
        PixelColor(UIColor.systemBrown)
#endif
    }
    
    public static var mint: PixelColor{
#if os(macOS)
        PixelColor(NSColor.systemMint)
#else
        if #available(iOS 15.0, tvOS 15.0, *) {
            PixelColor(UIColor.systemMint)
        } else {
            .gray
        }
#endif
    }
}
