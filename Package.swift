// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "spm-and-docker",
    platforms: [
       .macOS(.v10_15),
    ],
    products: [
        .executable(name: "Run", targets: ["Run"]),
        .library(name: "App", targets: ["App"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.8.0"),
    ],
    targets: [
        .target(name: "Run", dependencies: ["App"]),
        .target(name: "App", dependencies: [
            .product(name: "Vapor", package: "vapor"),
        ]),
        .target(name: "Deps", dependencies: [ 
            .product(name: "Vapor", package: "vapor"),
        ]),
    ]
)
