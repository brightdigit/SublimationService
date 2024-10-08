// swift-tools-version: 6.0

import PackageDescription

let swiftSettings: [SwiftSetting] = [
  SwiftSetting.enableExperimentalFeature("AccessLevelOnImport"),
  SwiftSetting.enableExperimentalFeature("BitwiseCopyable"),
  SwiftSetting.enableExperimentalFeature("GlobalActorIsolatedTypesUsability"),
  SwiftSetting.enableExperimentalFeature("IsolatedAny"),
  SwiftSetting.enableExperimentalFeature("MoveOnlyPartialConsumption"),
  SwiftSetting.enableExperimentalFeature("NestedProtocols"),
  SwiftSetting.enableExperimentalFeature("NoncopyableGenerics"),
  SwiftSetting.enableExperimentalFeature("RegionBasedIsolation"),
  SwiftSetting.enableExperimentalFeature("TransferringArgsAndResults"),
  SwiftSetting.enableExperimentalFeature("VariadicGenerics"),

  SwiftSetting.enableUpcomingFeature("FullTypedThrows"),
  SwiftSetting.enableUpcomingFeature("InternalImportsByDefault")

  // SwiftSetting.unsafeFlags([
  //   "-Xfrontend",
  //   "-warn-long-function-bodies=100"
  // ]),
  // SwiftSetting.unsafeFlags([
  //   "-Xfrontend",
  //   "-warn-long-expression-type-checking=100"
  // ])
]

let package = Package(
  name: "SublimationService",
  platforms: [
    .macOS(.v14),
    .iOS(.v17),
    .watchOS(.v10),
    .tvOS(.v17),
    .visionOS(.v1),
    .macCatalyst(.v17)
  ],
  products: [
    .library(name: "SublimationService", targets: ["SublimationService"])
  ],
  dependencies: [    
    .package(url: "https://github.com/brightdigit/Sublimation", from: "2.0.0-alpha.5"),
    .package(url: "https://github.com/swift-server/swift-service-lifecycle.git", from: "2.6.0")
  ],
  targets: [
    .target(
      name: "SublimationService",
      dependencies: [
        .product(name: "Sublimation", package: "Sublimation"),
        .product(name: "ServiceLifecycle", package: "swift-service-lifecycle")
      ],
      swiftSettings: swiftSettings
    ),
    .testTarget(
      name: "SublimationServiceTests",
      dependencies: ["SublimationService"]
    )
  ]
)

