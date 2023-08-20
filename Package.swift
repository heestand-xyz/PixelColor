// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "PixelColor",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14),
        .macOS(.v11),
        .visionOS(.v1)
    ],
    products: [
        .library(name: "PixelColor", targets: ["PixelColor"]),
    ],
    targets: [
        .target(name: "PixelColor", dependencies: []),
        .testTarget(name: "PixelColorTests", dependencies: ["PixelColor"])
    ]
)
