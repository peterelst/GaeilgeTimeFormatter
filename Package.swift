// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "GaeilgeTimeFormatter",
    platforms: [
        .watchOS(.v8),
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "GaeilgeTimeFormatter",
            targets: ["GaeilgeTimeFormatter"]),
    ],
    targets: [
        .target(
            name: "GaeilgeTimeFormatter"),
        .testTarget(
            name: "GaeilgeTimeFormatterTests",
            dependencies: ["GaeilgeTimeFormatter"]
        ),
    ]
)
