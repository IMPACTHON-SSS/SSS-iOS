import ProjectDescription

public extension Project {
    static func executable(
        name: String,
        platform: Platform,
        product: Product = .app,
        deploymentTarget: DeploymentTarget = .iOS(targetVersion: "16.0", devices: [.iphone]),
        dependencies: [TargetDependency],
        entitlements: Entitlements? = nil,
        settings: Settings? = nil
    ) -> Project {
        Project(
            name: name,
            organizationName: publicOrganizationName,
            targets: [
                Target(
                    name: name,
                    platform: platform,
                    product: product,
                    bundleId: "\(publicOrganizationName).\(name.lowercased())",
                    deploymentTarget: deploymentTarget,
                    infoPlist: .file(path: Path("Support/Info.plist")),
                    sources: ["Sources/**"],
                    resources: ["Resources/**"],
                    entitlements: entitlements,
                    scripts: [.swiftLint],
                    dependencies: [
                        .project(target: "ThirdPartyLib", path: "../ThirdPartyLib")
                    ] + dependencies,
                    settings: settings
                )
            ]
        )
    }
}
