import SwiftUI
import Swinject
import Presentation
import Service

@main
struct SSSApp: App {
    @StateObject var appState = AppState(sceneFlow: .splash)
    private let rootView: RootView

    init() {
        _ = Assembler([
            PresentationDI()
        ], container: DI.container)

        rootView = DI.container.resolve(RootView.self)!
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                rootView
                    .environmentObject(appState)
            }
        }
    }
}
