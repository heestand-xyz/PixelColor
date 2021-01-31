// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "PixelColor",
    products: [
        .library(name: "PixelColor", targets: ["PixelColor"]),
    ],
    targets: [
        .target(name: "PixelColor", dependencies: []),
    ]
)
