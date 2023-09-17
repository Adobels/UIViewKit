// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIViewKit",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "UIViewKit",
            targets: ["UIViewKit"]),
    ],
    targets: [
        .target(
            name: "UIViewKit"
        ),
        .testTarget(
            name: "UIViewKitTests",
            dependencies: ["UIViewKit"]),
    ]
)
