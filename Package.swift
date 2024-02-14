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
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.15.3"),
    ],
    targets: [
        .target(
            name: "UIViewKit"
        ),
        .testTarget(
            name: "UIViewKitTests",
            dependencies: [
                "UIViewKit",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ])
    ]
)
