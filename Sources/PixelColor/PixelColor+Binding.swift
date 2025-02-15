//
//  PixelColor+Binding.swift
//  PixelColor
//
//  Created by a-heestand on 2025/02/15.
//

import SwiftUI

extension PixelColor {
    /// For use with SwiftUI's color picker.
    public static func mapBinding(_ color: Binding<PixelColor>) -> Binding<Color> {
        Binding {
            color.wrappedValue.linearToSRGB().displayP3
        } set: { newColor in
            color.wrappedValue = PixelColor(newColor, convertToColorSpace: CGColorSpace(name: CGColorSpace.linearSRGB)!)
        }
    }
}
