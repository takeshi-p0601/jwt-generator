// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "jwt-generator",
    dependencies: [
        .package(url: "https://github.com/Kitura/Swift-JWT.git", from: "4.0.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "jwt-generator",
            dependencies: [
                .product(name: "SwiftJWT", package: "Swift-JWT")
            ],
            path: "Sources"),
    ]
)
