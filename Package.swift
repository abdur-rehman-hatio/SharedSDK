// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SharedSDK",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SharedSDK",
            targets: ["SharedSDK"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "SharedSDK",
            url: "https://github.com/abdur-rehman-hatio/SharedSDK/releases/download/1.0.0/SharedSDK.xcframework.zip",
            checksum: "0c69bdf808aa52e4eaeed34c660387a1d9468fb683c10e999001d4fb71b7e9f4"
        )
    ]
)