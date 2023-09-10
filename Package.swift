// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIViewDSL",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "UIViewDSL",
            targets: ["UIViewDSL"]),
    ],
    targets: [
        .target(
            name: "UIViewDSL"
        ),
        .testTarget(
            name: "UIViewDSLTests",
            dependencies: ["UIViewDSL"]),
    ]
)
