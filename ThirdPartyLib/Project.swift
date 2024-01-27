import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "ThirdPartyLib",
    packages: [],
    deploymentTarget: .iOS(targetVersion: "15.9", devices: .iphone),
    dependencies: [
        .SPM.Swinject,
        .SPM.Sora
    ],
    scripts: [.swiftLint]
)
