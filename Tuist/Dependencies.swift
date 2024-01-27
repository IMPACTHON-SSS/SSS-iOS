import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(
                url: "https://github.com/Swinject/Swinject.git",
                requirement: .upToNextMajor(from: "2.8.0")
            ),
            .remote(
                url: "https://github.com/Mercen-Lee/Sora.git",
                requirement: .upToNextMajor(from: "1.0.1")
            ),
            .remote(
                url: "https://github.com/Mercen-Lee/FlowKit.git",
                requirement: .branch("main")
            ),
            .remote(
                url: "https://github.com/impacton-SSS/SSS-DesignSystem.git",
                requirement: .upToNextMajor(from: "1.0.6")
            )
        ]
    ),
    platforms: [.iOS]
)
