import SwiftUI

public struct SplashView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: SplashViewModel

    public init(viewModel: SplashViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        Text("Splash")
            .onAppear {
                appState.sceneFlow = .signin
            }
    }
}
