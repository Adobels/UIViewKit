// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIViewKit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "UIViewKit", targets: ["UIViewKit"])
    ],
    targets: [
        .target(name: "UIViewKit"),
        .testTarget(name: "UIViewKitTests", dependencies: ["UIViewKit"])
    ]
)
