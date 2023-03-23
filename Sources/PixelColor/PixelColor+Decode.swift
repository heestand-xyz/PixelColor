//
//  File.swift
//  
//
//  Created by Anton Heestand on 2021-11-22.
//

import SwiftUI

extension PixelColor {
    
    static func decode(color: Color) -> PixelColor? {
        
        let codableColor: CodableColor? = .decode(color: color)
        
        return codableColor?.pixelColor
    }
}
