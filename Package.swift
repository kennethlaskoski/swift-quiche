// swift-tools-version: 5.6

import PackageDescription

let package = Package(
  name: "SwiftQuiche",
  platforms: [.macOS(.v12)],
  products: [
    .library(
      name: "SwiftQuiche",
      targets: ["SwiftQuiche"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-nio", from: "2.0.0"),
    .package(url: "https://github.com/kennethlaskoski/xc-quiche.git", branch: "main"),
  ],
  targets: [
    .target(
      name: "SwiftQuiche",
      dependencies: [
        .product(name: "NIOCore", package: "swift-nio"),
//        .product(name: "NIOPosix", package: "swift-nio"),
        .product(name: "XCQuiche", package: "xc-quiche"),
      ]
    ),
    .testTarget(
      name: "SwiftQuicheTests",
      dependencies: ["SwiftQuiche"]),
  ]
)
