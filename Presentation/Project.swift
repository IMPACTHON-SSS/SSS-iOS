import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "Presentation",
    platform: .iOS,
    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
    resources: ["Resources/**"], dependencies: [
        .SPM.SDS,
        .SPM.FlowKit,
        .project(target: "Service", path: Path("../Service"))
    ],
    scripts: [.swiftLint]
)
