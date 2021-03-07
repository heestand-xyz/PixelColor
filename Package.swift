// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "PixelColor",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .macOS(.v10_14),
    ],
    products: [
        .library(name: "PixelColor", targets: ["PixelColor"]),
    ],
    targets: [
        .target(name: "PixelColor", dependencies: []),
    ]
)
