// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "GaeilgeTimeFormatter",
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
