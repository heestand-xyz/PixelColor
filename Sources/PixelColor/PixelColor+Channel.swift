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
            case .red:   return .init(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.0)
            case .green: return .init(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.0)
            case .blue:  return .init(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.0)
            case .alpha: return .init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            }
        }
    }
    
    public var isPureChannel: Bool {
        let oneCount: Int = (red == 1.0 ? 1 : 0) + (green == 1.0 ? 1 : 0) + (blue == 1.0 ? 1 : 0) + (alpha == 1.0 ? 1 : 0)
        let zeroCount: Int = (red == 0.0 ? 1 : 0) + (green == 0.0 ? 1 : 0) + (blue == 0.0 ? 1 : 0) + (alpha == 0.0 ? 1 : 0)
        return oneCount == 1 && zeroCount == 3
    }
    
    public var pureChannel: Channel? {
        guard Bool(isPureChannel) else { return nil }
        if CGFloat(red) == 1.0 {
            return .red
        } else if CGFloat(green) == 1.0 {
            return .green
        } else if CGFloat(blue) == 1.0 {
            return .blue
        } else if CGFloat(alpha) == 1.0 {
            return .alpha
        } else { return nil }
    }
}
