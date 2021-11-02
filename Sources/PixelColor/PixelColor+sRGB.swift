//
//  File.swift
//  
//
//  Created by Anton Heestand on 2021-11-01.
//

import Foundation
import CoreGraphics

/// https://gist.github.com/adamgraham/263fac81705221a96e4719cb1ad36009

extension PixelColor {
    
    public var sRGB: PixelColor {
        linearToSRGB()
    }
    
    func sRGBToLinear() -> PixelColor {

        let red = (red > 0.03928) ? pow((red + 0.055) / 1.055, 2.4) : (red / 12.92)
        let green = (green > 0.03928) ? pow((green + 0.055) / 1.055, 2.4) : (green / 12.92)
        let blue = (blue > 0.03928) ? pow((blue + 0.055) / 1.055, 2.4) : (blue / 12.92)
      
        return PixelColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    func linearToSRGB() -> PixelColor {

        let k: CGFloat = 1.0 / 2.4
        
        let red = (red <= 0.00304) ? (12.92 * red) : (1.055 * pow(red, k) - 0.055)
        let green = (green <= 0.00304) ? (12.92 * green) : (1.055 * pow(green, k) - 0.055)
        let blue = (blue <= 0.00304) ? (12.92 * blue) : (1.055 * pow(blue, k) - 0.055)

        return PixelColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
