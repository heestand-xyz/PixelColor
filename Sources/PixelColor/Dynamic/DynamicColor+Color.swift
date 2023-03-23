import SwiftUI
#if os(macOS)
import AppKit
#else
import UIKit
#endif

extension DynamicColor {
    
    public var pixelColor: PixelColor {
        switch self {
        case .primary:
            switch PixelColor.appearance {
            case .dark:
                return .white
            case .light:
                return .black
            }
        case .white:
            return .white
        case .black:
            return .black
        case .gray:
            #if os(macOS)
            return PixelColor(NSColor.systemGray)
            #else
            return PixelColor(UIColor.systemGray)
            #endif
        case .red:
            #if os(macOS)
            return PixelColor(NSColor.systemRed)
            #else
            return PixelColor(UIColor.systemRed)
            #endif
        case .green:
            #if os(macOS)
            return PixelColor(NSColor.systemGreen)
            #else
            return PixelColor(UIColor.systemGreen)
            #endif
        case .blue:
            #if os(macOS)
            return PixelColor(NSColor.systemBlue)
            #else
            return PixelColor(UIColor.systemBlue)
            #endif
        case .indigo:
            #if os(macOS)
            return PixelColor(NSColor.systemIndigo)
            #else
            return PixelColor(UIColor.systemIndigo)
            #endif
        case .orange:
            #if os(macOS)
            return PixelColor(NSColor.systemOrange)
            #else
            return PixelColor(UIColor.systemOrange)
            #endif
        case .pink:
            #if os(macOS)
            return PixelColor(NSColor.systemPink)
            #else
            return PixelColor(UIColor.systemPink)
            #endif
        case .purple:
            #if os(macOS)
            return PixelColor(NSColor.systemPurple)
            #else
            return PixelColor(UIColor.systemPurple)
            #endif
        case .teal:
            #if os(macOS)
            return PixelColor(NSColor.systemTeal)
            #else
            return PixelColor(UIColor.systemTeal)
            #endif
        case .yellow:
            #if os(macOS)
            return PixelColor(NSColor.systemYellow)
            #else
            return PixelColor(UIColor.systemYellow)
            #endif
        case .brown:
            #if os(macOS)
            return PixelColor(NSColor.systemBrown)
            #else
            return PixelColor(UIColor.systemBrown)
            #endif
        case .mint:
            #if os(macOS)
            return PixelColor(NSColor.systemMint)
            #else
            return PixelColor(UIColor.systemMint)
            #endif
        }
    }
}
