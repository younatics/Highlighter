// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "Highlighter",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "Highlighter", targets: ["Highlighter"])
    ],
    targets: [
        .target(
            name: "Highlighter",
            path: "Highlighter",
            exclude: [
                "Highlighter.h",
                "Info.plist"
            ],
            swiftSettings: [
                .swiftLanguageMode(.v6)
            ]
        ),
        .testTarget(
            name: "HighlighterTests",
            dependencies: ["Highlighter"],
            path: "Tests/HighlighterTests",
            swiftSettings: [
                .swiftLanguageMode(.v6)
            ]
        )
    ]
)
