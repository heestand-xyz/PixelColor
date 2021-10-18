//
//  File.swift
//  
//
//  Created by Anton Heestand on 2021-06-21.
//

#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

extension PixelColor {
    
    public enum Appearance {
        case light
        case dark
    }
    
    public static var appearance: Appearance {
        #if os(macOS)
        return NSApp.effectiveAppearance.name == .darkAqua ? .dark : .light
        #elseif os(tvOS)
        return .dark
        #else
        return UIView().traitCollection.userInterfaceStyle == .dark ? .dark : .light
        #endif
    }
}
