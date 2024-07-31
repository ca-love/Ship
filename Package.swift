// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Ship",
    platforms: [.macOS(.v13), .iOS(.v16), .tvOS(.v16), .watchOS(.v9)],
    products: [
        .library(name: "Ship", targets: ["Ship"])
    ],
    dependencies: [
        .package(url: "https://github.com/ca-love/APIKit.git", .branch("feature/swift6-concurrency"))
    ],
    targets: [
        .target(name: "Ship", dependencies: ["APIKit"], path: "Ship"),
        .testTarget(name: "ShipTests", dependencies: ["Ship"], path: "ShipTests")
    ],
    swiftLanguageVersions: [.v5]
)
