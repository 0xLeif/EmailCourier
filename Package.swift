// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EmailCourier",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "EmailCourier",
            targets: ["EmailCourier"]),
    ],
    targets: [
        .target(
            name: "EmailCourier",
            dependencies: []),
        .testTarget(
            name: "EmailCourierTests",
            dependencies: ["EmailCourier"]),
    ]
)
