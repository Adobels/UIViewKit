// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIViewKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "UIViewKit", targets: ["UIViewKit"]),
        //.library(name: "UIViewKitDevelopmentViews", targets: ["UIViewKitDevelopmentViews"])
    ],
    targets: [
        .target(
            name: "UIViewDSL"
        ),
        .target(
            name: "UIViewKit",
            dependencies: [
                "UIViewDSL",
            ]
        ),
        .target(
            name: "UIViewKitDevelopmentViews",
            dependencies: ["UIViewKit", "UIViewDSL"]
        ),
        .testTarget(
            name: "UIViewKitTests",
            dependencies: ["UIViewKit", "UIViewDSL", "UIViewKitDevelopmentViews"])
    ]
)
