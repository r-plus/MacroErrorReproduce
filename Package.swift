// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "MacroErrorReproduce",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MacroErrorReproduce",
            targets: ["MacroErrorReproduce"]
        ),
        .executable(
            name: "MacroErrorReproduceClient",
            targets: ["MacroErrorReproduceClient"]
        ),
    ],
    dependencies: [
        // Depend on the Swift 5.9 release of SwiftSyntax
        .package(url: "https://github.com/apple/swift-syntax.git", from: "510.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        // Macro implementation that performs the source transformation of a macro.
        .macro(
            name: "MacroErrorReproduceMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),

        // Library that exposes a macro as part of its API, which is used in client programs.
        .target(name: "MacroErrorReproduce", dependencies: ["MacroErrorReproduceMacros"]),

        // A client of the library, which is able to use the macro in its own code.
        .executableTarget(name: "MacroErrorReproduceClient", dependencies: ["MacroErrorReproduce"]),

        // A test target used to develop the macro implementation.
        .testTarget(
            name: "MacroErrorReproduceTests",
            dependencies: [
                "MacroErrorReproduceMacros",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        ),
    ]
)
