// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Universe Docs Web",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/IBM-Swift/Kitura.git",
                 .upToNextMinor(from: "2.4.1")),
        // 3
        .package(url: "https://github.com/IBM-Swift/HeliumLogger.git",
                 .upToNextMinor(from: "1.7.1")),
        .package(url: "https://github.com/IBM-Swift/Kitura-CredentialsFacebook.git", from: "2.0.0"),
        .package(url: "https://github.com/IBM-Swift/Kitura-CredentialsGoogle.git", from: "2.0.0"),
        .package(url: "https://github.com/IBM-Swift/Kitura-CredentialsHTTP.git", from: "2.0.0"),
        .package(url: "https://github.com/IBM-Swift/Swift-SMTP", .upToNextMinor(from: "5.1.0")),
        .package(url: "https://github.com/IBM-Swift/Kitura-StencilTemplateEngine.git", from: "1.8.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Universe Docs Web",
            dependencies: ["Kitura" , "HeliumLogger", "CredentialsFacebook", "CredentialsGoogle", "CredentialsHTTP", "SwiftSMTP", "KituraStencil"]),
        .testTarget(
            name: "Universe Docs WebTests",
            dependencies: ["Universe Docs Web"]),
    ]
)
