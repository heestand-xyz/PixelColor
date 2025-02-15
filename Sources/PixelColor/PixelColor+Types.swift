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
    
    /// SwiftUI Color
    public var color: Color {
        Color(red: red, green: green, blue: blue, opacity: opacity)
    }
    
    /// SwiftUI Color
    @available(*, deprecated, renamed: "displayP3")
    public var colorP3: Color {
        displayP3
    }
    
    /// SwiftUI Color
    public var displayP3: Color {
        Color(.displayP3, red: red, green: green, blue: blue, opacity: opacity)
    }
    
    #if os(macOS)
    
    public var nsColor: NSColor {
        NSColor(red: red, green: green, blue: blue, alpha: opacity)
    }
    
    public var nsColorP3: NSColor {
        NSColor(displayP3Red: red, green: green, blue: blue, alpha: opacity)
    }
    
    #else
    
    public var uiColor: UIColor {
        UIColor(red: red, green: green, blue: blue, alpha: opacity)
    }
    
    public var uiColorP3: UIColor {
        UIColor(displayP3Red: red, green: green, blue: blue, alpha: opacity)
    }
    
    #endif
    
    var colorSpace: CGColorSpace {
        if saturation > 0.0 {
            return CGColorSpace(name: CGColorSpace.sRGB)!
        } else {
            return CGColorSpace(name: CGColorSpace.genericGrayGamma2_2)!
        }
    }
    
    public var ciColor: CIColor {
        if saturation > 0.0 {
            return CIColor(red: red, green: green, blue: blue, alpha: opacity, colorSpace: colorSpace) ?? .clear
        } else {
            return CIColor(cgColor: cgColor)
        }
    }
    
    public var cgColor: CGColor {
        if saturation > 0.0 {
            return CGColor(colorSpace: colorSpace, components: components) ?? CGColor(gray: 0.0, alpha: 0.0)
        } else {
            return CGColor(colorSpace: CGColorSpace(name: CGColorSpace.genericGrayGamma2_2)!, components: greyComponents) ?? CGColor(gray: 0.0, alpha: 0.0)
        }
    }
}
