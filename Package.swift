// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "PixelColor",
    platforms: [
        .iOS(.v15),
        .tvOS(.v15),
        .macOS(.v11),
    ],
    products: [
        .library(name: "PixelColor", targets: ["PixelColor"]),
    ],
    targets: [
        .target(name: "PixelColor", dependencies: []),
        .testTarget(name: "PixelColorTests", dependencies: ["PixelColor"])
    ]
)
