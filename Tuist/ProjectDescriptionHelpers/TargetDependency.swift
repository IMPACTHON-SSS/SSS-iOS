import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let Swinject = TargetDependency.external(name: "Swinject")
    static let Sora = TargetDependency.external(name: "Sora")
    static let FlowKit = TargetDependency.external(name: "FlowKit")
    static let SDS = TargetDependency.external(name: "SDS")
}
