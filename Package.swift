// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FinalPackage",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "FinalPackage",
            targets: ["FinalPackage"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/AnyMindG/InMobiAdSDK.git", from: "1.1.0"),
        .package(url: "https://github.com/AnyMindG/GoogleMobileAdsMediationInMobi.git", from: "1.2.0"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", from: "11.13.0"),
    ],
    targets: [
        .binaryTarget(
            name: "PAGAdSDK",
            url: "https://github.com/AnyMindG/AllFrameworks/releases/download/10000.3.0/PAGAdSDK.zip",
            checksum: "c6363d4f71824814089dd40be94448484e73d930ecb0e18e7586d03f9dcbda35" // Generate checksum using `shasum -a 256 <file>`
        ),
        .binaryTarget(
            name: "GoogleMobileAdsMediationPangle",
            url: "https://github.com/AnyMindG/AllFrameworks/releases/download/10000.4.0/GoogleMobileAdsMediationPangle.zip",
            checksum: "8663f4596e6f95362562593e0f499706a696c8159f573a363bcf276dc801495a" // Generate checksum using `shasum -a 256 <file>`
        ),
        .target(
            name: "FinalPackage",
            dependencies: [
                "PAGAdSDK",
                "GoogleMobileAdsMediationPangle",
                .product(name: "InMobiAdSDK", package: "InMobiAdSDK"),
                .product(name: "GoogleMobileAdsMediationInMobi", package: "GoogleMobileAdsMediationInMobi"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
            ],
            linkerSettings: [
                .linkedFramework("WebKit"),
                .linkedFramework("AdSupport"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("StoreKit"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("UIKit"),
                .linkedFramework("AudioToolbox"),
                .linkedFramework("CFNetwork"),
                .linkedFramework("MediaPlayer"),
                .linkedFramework("QuartzCore"),
            ]
        ),
        .testTarget(
            name: "FinalPackageTests",
            dependencies: ["FinalPackage"]
        ),
    ]
)
