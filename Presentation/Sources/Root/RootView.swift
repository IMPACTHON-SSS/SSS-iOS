import SwiftUI

public struct RootView: View {
    @EnvironmentObject var appState: AppState

    private let signinView: SigninView
    private let homeView: HomeView
    private let splashView: SplashView

    public init(
        signinView: SigninView,
        homeView: HomeView,
        splashView: SplashView
    ) {
        self.signinView = signinView
        self.homeView = homeView
        self.splashView = splashView
    }

    public var body: some View {
        ZStack {
            switch appState.sceneFlow {
            case .signin:
                signinView
                    .environmentObject(appState)

            case .home:
                homeView
                    .environmentObject(appState)

            case .splash:
                splashView
                    .environmentObject(appState)
            }
        }
        .animation(.easeInOut, value: appState.sceneFlow)
        .transition(.opacity.animation(.easeInOut))
    }
}
