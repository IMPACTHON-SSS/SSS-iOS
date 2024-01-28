import Foundation

public final class AppState: ObservableObject {
    public init(sceneFlow: SceneFlow) {
        self.sceneFlow = sceneFlow
    }

    @Published public var sceneFlow: SceneFlow
}

public enum SceneFlow: String, RawRepresentable {
    case splash
    case signin
    case home
}
