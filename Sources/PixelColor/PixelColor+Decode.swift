//
//  File.swift
//  
//
//  Created by Anton Heestand on 2021-11-22.
//

import SwiftUI

@available(macOS 10.15, *)
extension PixelColor {
    
    static func decode(color: Color) -> PixelColor? {

        switch color.description {
        case "primary":
            return .primary
        case "clear":
            return .clear
        case "black":
            return .black
        case "white":
            return .white
        case "gray":
            return .gray
        case "red":
            return .red
        case "green":
            return .green
        case "blue":
            return .blue
        case "indigo":
            return .indigo
        case "orange":
            return .orange
        case "pink":
            return .pink
        case "purple":
            return .purple
        case "teal":
            return .teal
        case "yellow":
            return .yellow
        case "brown":
            return .brown
        case "mint":
            if #available(iOS 15.0, tvOS 15.0, macOS 12.0, *) {
                return .mint
            } else {
                return nil
            }
        default:
            
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
        }
        
        return nil
    }
}
