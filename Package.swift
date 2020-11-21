// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SPM-in-Docker",
    platforms: [
       .macOS(.v10_15),
    ],
    products: [
        .executable(name: "Run", targets: ["Run"]),
        .library(name: "App", targets: ["App"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.8.0"),
        .package(url: "https://github.com/vapor/leaf.git", from: "4.0.0"),
    ],
    targets: [
        .target(name: "Run", dependencies: ["App"]),
        .target(name: "App", dependencies: [
            .product(name: "Vapor", package: "vapor"),
            .product(name: "Leaf", package: "leaf"),
        ]),
        .target(name: "Deps", dependencies: [ 
            .product(name: "Vapor", package: "vapor"),
            .product(name: "Leaf", package: "leaf"),
        ]),
    ]
)
