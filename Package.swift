// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIViewKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "UIViewKit", targets: ["UIViewKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/Adobels/CodeCallTracker.git", .upToNextMinor(from: "1.0.0"))
    ],
    targets: [
        .target(name: "UIViewKit", dependencies: ["CodeCallTracker"]),
        .testTarget(name: "UIViewKitTests", dependencies: ["UIViewKit"])
    ]
)
