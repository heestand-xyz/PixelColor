//
//  PixelColor+Decode.swift
//  PixelColor
//
//  Created by Anton on 2024-12-23.
//

import SwiftUI

extension PixelColor {
    
    static func decode(color: Color) -> PixelColor? {
        
        func namedColor(_ name: String) -> PixelColor? {
            switch name {
            case "gray": return .gray
            case "red": return .red
            case "orange": return .orange
            case "yellow": return .yellow
            case "green": return .green
            case "mint": return .mint
            case "teal": return .teal
            case "blue": return .blue
            case "indigo": return .indigo
            case "purple": return .purple
            case "pink": return .pink
            case "brown": return .brown
            default: return nil
            }
        }
        
        if let color: PixelColor = namedColor(color.description) {
            return color
        }
        
        if color.description.contains("%") {
            
            let parts = color.description.components(separatedBy: "% ")
            guard parts.count == 2 else { return nil }
            
            let percentage = Int(parts.first!) ?? 100
            let opacity = CGFloat(percentage) / 100
         
            guard let color: PixelColor = namedColor(String(parts.last!)) else { return nil }
            
            return color.withOpacity(of: opacity)
        }
        
        if color.description.starts(with: "NamedColor") {
            let components = color.description.components(separatedBy: "\"")
            guard components.count >= 3 else { return nil }
            let name: String = components[1]
            #if os(macOS)
            guard let color = NSColor(named: name) else { return nil }
            #else
            guard let color = UIColor(named: name) else { return nil }
            #endif
            return PixelColor(color)
        }
        
        return nil
    }
}
