import ProjectDescriptionHelpers
import ProjectDescription

let project = Project.executable(
    name: "SSS",
    platform: .iOS,
    dependencies: [
        .project(target: "Presentation", path: Path("../Presentation")),
        .project(target: "Service", path: Path("../Service"))
    ]
)
