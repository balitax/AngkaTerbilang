// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AngkaTerbilang",
    platforms: [
        .iOS(.v13), 
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "AngkaTerbilang",
            targets: ["AngkaTerbilang"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AngkaTerbilang", dependencies: []),
        .testTarget(
            name: "AngkaTerbilangTests",
            dependencies: ["AngkaTerbilang"]
        ),
    ]
)
