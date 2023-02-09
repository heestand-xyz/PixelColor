//
//  Created by Anton Heestand on 2023-02-09.
//

extension PixelColor: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(red)
        hasher.combine(green)
        hasher.combine(blue)
        hasher.combine(alpha)
        hasher.combine(Self.appearance)
    }
}
