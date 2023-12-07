//
//  Created by Anton Heestand on 2023-12-07.
//

extension PixelColor {
    
    public static func random() -> PixelColor {
        PixelColor(red: .random(in: 0.0...1.0),
                   green: .random(in: 0.0...1.0),
                   blue: .random(in: 0.0...1.0))
    }
    
    public static func randomHue() -> PixelColor {
        PixelColor(hue: .random(in: 0.0...1.0),
                   saturation: 1.0,
                   brightness: 1.0)
    }
}
