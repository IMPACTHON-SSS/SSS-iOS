import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "Presentation",
    platform: .iOS,
    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
    resources: ["Resources/**"], dependencies: [
        .SPM.SDS,
        .SPM.FlowKit
    ],
    scripts: [.swiftLint]
)
