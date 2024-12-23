
# PixelColor

A Swift 6 package for working with colors at the pixel level. The `PixelColor` struct provides utilities for defining, manipulating, and converting colors with `red`, `green`, `blue`, and `opacity` channels (`CGFloat`). 

---

## Features

- **Color Channels**:
    - Work with individual `red`, `green`, `blue`, and `opacity` channels.
- **Color Conversions**:
  - Use `hue`, `saturation`, and `brightness` (HSB) representations.
  - Get a SwiftUI `Angle` of the hue (`.hueAngle`).
  - Initialize colors using `hex` strings with or without opacity.
- **Built-in Colors**:
  - System colors like `.red`, `.green`, `.blue`, `.orange`, `.teal`, etc.
  - Raw colors for precision: `.rawRed`, `.rawYellow`, `.rawGreen`, etc.
  - Clear "white" color for blending gradients (`.clearWhite`).
  - Adaptable colors (`.primary`, `.background`) that respect light/dark appearance modes.
- **Operators**:
  - Arithmetic (`+`, `-`, `*`, `/`) for blending and scaling colors.
  - Prefix operator `!` for inverting colors.
- **Codable, Equatable and Hashable**: 
    - Serialize, equate and hash colors easily.
- **Sendable**:
    - Work with colors concurrently.
- **SwiftUI / UIKit / AppKit Compatibility**:
  - Convert `PixelColor` to and from SwiftUI's `Color` or platform-specific `UIColor`/`NSColor`.
- **Utility Methods**:
  - Modify hue, saturation, brightness, and opacity.
  - Generate random colors (`.random()`) or random fully saturated hues (`.randomHue()`).
  - Check and identify pure channel colors (`.isPureChannel`).

---

## Installation

### Swift Package Manager (SPM)

Add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/heestand-xyz/PixelColor", from: "3.0.0")
]
```

Then, import `PixelColor` in your code:

```swift
import PixelColor
```

---

## Usage

### 1. Creating Colors

#### Using RGB Values
```swift
let color = PixelColor(red: 0.5, green: 0.25, blue: 0.75, opacity: 1.0)
```

#### Using Hex Strings
```swift
let color = PixelColor(hex: "#FF8000") // Orange
let semiTransparentColor = PixelColor(hexWithOpacity: "#FF800080") // 50% transparent orange
```

#### Using HSB
```swift
let color = PixelColor(hue: 0.5, saturation: 1.0, brightness: 1.0, opacity: 1.0)
```

---

### 2. Modifying Colors

#### Adjust Hue
```swift
let shiftedColor = color.shiftHue(by: .degrees(180))
```

#### Adjust Brightness
```swift
let brighterColor = color.brighten(by: 1.5)
```

#### Adjust Opacity
```swift
let semiTransparentColor = color.withOpacity(of: 0.5)
```

---

### 3. Color Conversions

> Note that `PixelColor` does not manage the color space, these functions are just for convenience.

#### Convert to Linear Space
```swift
let linearColor = color.sRGBToLinear()
```

#### Convert to sRGB Space
```swift
let srgbColor = linearColor.linearToSRGB()
```

#### Convert to SwiftUI or Platform Colors
```swift
let swiftUIColor: Color = color.color
let uiColor: UIColor = color.uiColor
/// macOS only
let nsColor: NSColor = color.nsColor
```

---

### 4. Operators

#### Blend Colors
```swift
let blendedColor = color1 + color2
```

#### Invert a Color
```swift
let invertedColor = !color
```

#### Scale Color Channels
```swift
let scaledColor = color * 0.8
```

---

### 5. Utilities

#### Generate Random Colors
```swift
let randomColor = PixelColor.random()
let randomHueColor = PixelColor.randomHue()
```

#### Check Pure Channels

> `PixelColor.Channel` is an enum of the 4 channels.

```swift
if color.hasPureChannel {
    print("Pure channel: \(color.pureChannel!)")
}
```

> A color has a pure channel when one channel is at `1.0` and the other channels are at `0.0`.

---

## Examples

### Adaptable Colors
```swift
let primaryColor = PixelColor.primary // White in dark mode, black in light mode
let backgroundColor = PixelColor.background // Opposite of primary
```

### Hex Conversion
```swift
let hex = color.hex // "7F3FBF"
let hexWithOpacity = color.hexWithOpacity // "7F3FBFFF"
```

---

## Contributing

Feel free to submit pull requests or open issues for improvements and feature requests.

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

## Acknowledgments

Developed by [Anton Heestand](http://heestand.xyz)
