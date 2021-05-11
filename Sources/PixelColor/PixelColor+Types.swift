//
//  File.swift
//  
//
//  Created by Anton Heestand on 2021-05-11.
//

import Foundation

extension PixelColor {
    
    @available(macOS 10.15, *)
    public var color: Color {
        #if os(macOS)
        return Color(nsColor)
        #else
        return Color(uiColor)
        #endif
    }
    
    #if os(macOS)
    
    public var nsColor: NSColor {
        NSColor(displayP3Red: red, green: green, blue: blue, alpha: alpha)
    }
    
    #else
    
    public var uiColor: UIColor {
        UIColor(displayP3Red: red, green: green, blue: blue, alpha: alpha)
    }
    
    #endif
    
    public var ciColor: CIColor {
        if saturation > 0.0 {
            return CIColor(red: red, green: green, blue: blue, alpha: alpha, colorSpace: colorSpace) ?? .clear
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
