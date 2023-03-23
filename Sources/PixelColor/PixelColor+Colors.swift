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
    
    public static var primary: PixelColor {
        Self.appearance == .dark ? .white : .black
    }
    
    public static var clear: PixelColor = .init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
    public static var clearWhite: PixelColor = .init(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0)

    public static var white: PixelColor = .init(white: 1.0)
    public static var black: PixelColor = .init(white: 0.0)

    public static var rawGray: PixelColor = .init(white: 0.5)
    public static var rawRed: PixelColor = .init(red: 1.0, green: 0.0, blue: 0.0)
    public static var rawYellow: PixelColor = .init(red: 1.0, green: 1.0, blue: 0.0)
    public static var rawGreen: PixelColor = .init(red: 0.0, green: 1.0, blue: 0.0)
    public static var rawCyan: PixelColor = .init(red: 0.0, green: 1.0, blue: 1.0)
    public static var rawBlue: PixelColor = .init(red: 0.0, green: 0.0, blue: 1.0)
    public static var rawMagenta: PixelColor = .init(red: 1.0, green: 0.0, blue: 1.0)
    
    public static func brightness(_ brightness: CGFloat, alpha: CGFloat = 1.0) -> PixelColor {
        PixelColor(hue: 0.0, saturation: 0.0, brightness: brightness, alpha: alpha)
    }
    
    public static func hue(_ hue: CGFloat, alpha: CGFloat = 1.0) -> PixelColor {
        PixelColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: alpha)
    }
}

extension PixelColor {
    
    public static var gray: PixelColor {
        DynamicColor.gray.pixelColor
    }
    
    public static var red: PixelColor{
        DynamicColor.red.pixelColor
    }
    
    public static var green: PixelColor{
        DynamicColor.green.pixelColor
    }
    
    public static var blue: PixelColor {
        DynamicColor.blue.pixelColor
    }
    
    public static var indigo: PixelColor{
        DynamicColor.indigo.pixelColor
    }
    
    public static var orange: PixelColor{
        DynamicColor.orange.pixelColor
    }
    
    public static var pink: PixelColor{
        DynamicColor.pink.pixelColor
    }
    
    public static var purple: PixelColor{
        DynamicColor.purple.pixelColor
    }
    
    public static var teal: PixelColor{
        DynamicColor.teal.pixelColor
    }
    
    public static var yellow: PixelColor{
        DynamicColor.yellow.pixelColor
    }
    
    public static var brown: PixelColor{
        DynamicColor.brown.pixelColor
    }
    
    public static var mint: PixelColor{
        DynamicColor.mint.pixelColor
    }
}
