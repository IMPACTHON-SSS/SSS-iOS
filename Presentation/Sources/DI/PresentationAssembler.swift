import Foundation
import Swinject

public final class PresentationDI: Assembly {
    public init() {}

    public func assemble(container: Container) {
        // Auth
        container.register(SplashView.self) { resolver in
            SplashView(viewModel: resolver.resolve(SplashViewModel.self)!)
        }
        container.register(SplashViewModel.self) { _ in
            SplashViewModel()
        }
        container.register(SigninView.self) { resolver in
            SigninView(viewModel: resolver.resolve(SigninViewModel.self)!)
        }
        container.register(SigninViewModel.self) { _ in
            SigninViewModel()
        }

        // Root
        container.register(RootView.self) { resolver in
            RootView(
                signinView: resolver.resolve(SigninView.self)!,
                homeView: resolver.resolve(HomeView.self)!,
                splashView: resolver.resolve(SplashView.self)!
            )
        }

        // Home
        container.register(HomeView.self) { resolver in
            HomeView(viewModel: resolver.resolve(HomeViewModel.self)!, diaryView: resolver.resolve(DiaryView.self)!)
        }
        container.register(HomeViewModel.self) { _ in
            HomeViewModel()
        }
        container.register(DiaryView.self) { resolver in
            DiaryView(
                successDiaryView: resolver.resolve(SuccessDiaryView.self)!
            )
        }
        container.register(SuccessDiaryView.self) { resolver in
            SuccessDiaryView(viewModel: resolver.resolve(SuccessDiaryViewModel.self)!)
        }
        container.register(SuccessDiaryViewModel.self) { _ in
            SuccessDiaryViewModel()
        }
    }
}
