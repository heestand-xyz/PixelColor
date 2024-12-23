//
//  File.swift
//  
//
//  Created by Anton Heestand on 2021-05-11.
//

import Foundation
import CoreGraphics

extension PixelColor: Codable {

    enum CodingKeys: CodingKey {
        case red
        case green
        case blue
        case opacity
        case alpha
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        red = try container.decode(CGFloat.self, forKey: .red)
        green = try container.decode(CGFloat.self, forKey: .green)
        blue = try container.decode(CGFloat.self, forKey: .blue)
        if container.contains(.alpha) {
            opacity = try container.decode(CGFloat.self, forKey: .alpha)
        } else {
            opacity = try container.decode(CGFloat.self, forKey: .opacity)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(red, forKey: .red)
        try container.encode(green, forKey: .green)
        try container.encode(blue, forKey: .blue)
        try container.encode(opacity, forKey: .opacity)
    }
}
