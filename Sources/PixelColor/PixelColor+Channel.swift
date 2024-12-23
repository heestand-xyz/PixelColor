//
//  File.swift
//  
//
//  Created by Anton Heestand on 2021-05-11.
//

import Foundation
import CoreGraphics

extension PixelColor {
    
    public enum Channel: Int {
        case red
        case green
        case blue
        case alpha
        var color: PixelColor {
            switch self {
            case .red:   return PixelColor(red: 1.0, green: 0.0, blue: 0.0, opacity: 0.0)
            case .green: return PixelColor(red: 0.0, green: 1.0, blue: 0.0, opacity: 0.0)
            case .blue:  return PixelColor(red: 0.0, green: 0.0, blue: 1.0, opacity: 0.0)
            case .alpha: return PixelColor(red: 0.0, green: 0.0, blue: 0.0, opacity: 1.0)
            }
        }
    }
    
    @available(*, deprecated, renamed: "hasPureChannel")
    public var isPureChannel: Bool {
        hasPureChannel
    }
    
    public var hasPureChannel: Bool {
        let oneCount: Int = (red == 1.0 ? 1 : 0) + (green == 1.0 ? 1 : 0) + (blue == 1.0 ? 1 : 0) + (opacity == 1.0 ? 1 : 0)
        let zeroCount: Int = (red == 0.0 ? 1 : 0) + (green == 0.0 ? 1 : 0) + (blue == 0.0 ? 1 : 0) + (opacity == 0.0 ? 1 : 0)
        return oneCount == 1 && zeroCount == 3
    }
    
    public var pureChannel: Channel? {
        guard hasPureChannel else { return nil }
        if red == 1.0 {
            return .red
        } else if green == 1.0 {
            return .green
        } else if blue == 1.0 {
            return .blue
        } else if opacity == 1.0 {
            return .alpha
        } else {
            return nil
        }
    }
}
