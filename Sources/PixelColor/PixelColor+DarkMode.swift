//
//  Created by Anton Heestand on 2021-06-21.
//

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

extension PixelColor {
    
    public enum Appearance: Hashable {
        case light
        case dark
    }
    
    @MainActor
    public static var appearance: Appearance {
#if os(macOS)
        return darkMode() ? .dark : .light
#elseif os(visionOS)
        return .dark
#else
        return UIScreen.main.traitCollection.userInterfaceStyle == .dark ? .dark : .light
#endif
    }
    
#if os(macOS)
    @MainActor
    private static func darkMode() -> Bool {
        NSApp?.effectiveAppearance.name == .darkAqua
    }
#endif
}
