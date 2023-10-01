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
    
    public static var appearance: Appearance {
        #if os(macOS)
        func darkMode() -> Bool {
            NSApp?.effectiveAppearance.name == .darkAqua
        }
        if Thread.isMainThread {
            return darkMode() ? .dark : .light
        } else {
            var appearance: Appearance!
            let semaphore = DispatchSemaphore(value: 0)
            DispatchQueue.main.async {
                appearance = darkMode() ? .dark : .light
                semaphore.signal()
            }
            _ = semaphore.wait(timeout: .distantFuture)
            return appearance
        }
        #elseif os(xrOS)
        return .dark
        #else
        return UIScreen.main.traitCollection.userInterfaceStyle == .dark ? .dark : .light
        #endif
    }
}
