// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KLoadingState",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7)
    ],
    products: [
        .library(
            name: "KLoadingState",
            targets: ["KLoadingState"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "KLoadingState",
            dependencies: []
        ),
    ]
)
