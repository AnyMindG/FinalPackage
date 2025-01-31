// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// FinalPackage v1.2.0
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
        .target(
            name: "FinalPackage",
            dependencies: [
                .product(name: "InMobiAdSDK", package: "InMobiAdSDK"),
                .product(name: "GoogleMobileAdsMediationInMobi", package: "GoogleMobileAdsMediationInMobi"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
            ]
        ),
        .testTarget(
            name: "FinalPackageTests",
            dependencies: ["FinalPackage"]
        ),
    ]
)
