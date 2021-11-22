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

        print("-------->", color.description)
        
        switch color.description {
        case "black":
            return .black
        case "white":
            return .white
        case "gray":
            return .gray
        case "blue":
            return .blue
        case "green":
            return .green
        case "indigo":
            return .indigo
        case "orange":
            return .orange
        case "pink":
            return .pink
        case "purple":
            return .purple
        case "red":
            return .red
        case "teal":
            return .teal
        case "yellow":
            return .yellow
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
