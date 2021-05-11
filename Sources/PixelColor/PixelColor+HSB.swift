//
//  File.swift
//  
//
//  Created by Anton Heestand on 2021-05-11.
//

import Foundation

extension PixelColor {
    
    typealias HSV = (h: CGFloat, s: CGFloat, v: CGFloat)
    typealias RGB = (r: CGFloat, g: CGFloat, b: CGFloat)
    
    public var hue: CGFloat {
        hsv().h
    }
    
    public var saturation: CGFloat {
        hsv().s
    }
   
    public var brightness: CGFloat {
        hsv().v
    }
    
    func hsv() -> (h: CGFloat, s: CGFloat, v: CGFloat) {
        let r: CGFloat = red
        let g: CGFloat = green
        let b: CGFloat = blue
        var h, s, v: CGFloat
        var mn, mx, d: CGFloat
        mn = r < g ? r : g
        mn = mn < b ? mn : b
        mx = r > g ? r : g
        mx = mx > b ? mx : b
        v = mx
        d = mx - mn
        if (d < 0.00001) {
            s = 0
            h = 0
            return (h: h, s: s, v: v)
        }
        if mx > 0.0 {
            s = d / mx
        } else {
            s = 0.0
            h = 0.0
            return (h: h, s: s, v: v)
        }
        if r >= mx {
            h = (g - b) / d
        } else if g >= mx {
            h = 2.0 + (b - r) / d
        } else {
            h = 4.0 + (r - g) / d
        }
        h *= 60.0
        if h < 0.0 {
            h += 360.0
        }
        h /= 360.0
        return (h: h, s: s, v: v)
    }
    
    static func rgb(hsv: HSV) -> RGB {
        rgb(h: hsv.h, s: hsv.s, v: hsv.v)
    }
    
    static func rgb(h: CGFloat, s: CGFloat, v: CGFloat) -> (r: CGFloat, g: CGFloat, b: CGFloat) {
        let r: CGFloat
        let g: CGFloat
        let b: CGFloat
        var hh, p, q, t, ff: CGFloat
        var i: Int
        if (s <= 0.0) {
            r = v
            g = v
            b = v
            return  (r: r, g: g, b: b)
        }
        hh = (h - floor(h)) * 360
        hh = hh / 60.0
        i = Int(hh)
        ff = hh - CGFloat(i)
        p = v * (1.0 - s)
        q = v * (1.0 - (s * ff))
        t = v * (1.0 - (s * (1.0 - ff)))
        switch(i) {
        case 0:
            r = v
            g = t
            b = p
        case 1:
            r = q
            g = v
            b = p
        case 2:
            r = p
            g = v
            b = t
        case 3:
            r = p
            g = q
            b = v
        case 4:
            r = t
            g = p
            b = v
        case 5:
            r = v
            g = p
            b = q
        default:
            r = v
            g = p
            b = q
        }
        return (r: r, g: g, b: b)
    }
}
