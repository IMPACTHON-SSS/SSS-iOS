import SwiftUI
import SDS

public struct SplashView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: SplashViewModel

    public init(viewModel: SplashViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        ZStack {
            Color.main.frame(maxWidth: .infinity, maxHeight: .infinity)

            Image.logo
        }
        .ignoresSafeArea()
        .onAppear {
            viewModel.onAppear {
                appState.sceneFlow = .home
            } onError: {
                appState.sceneFlow = .signin
            }
        }
    }
}
