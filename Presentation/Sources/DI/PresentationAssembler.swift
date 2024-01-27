import Foundation
import Swinject

public final class PresentationDI: Assembly {
    public init() {}

    public func assemble(container: Container) {
        // Auth
        container.register(SigninView.self) { resolver in
            SigninView(viewModel: resolver.resolve(SigninViewModel.self)!)
        }
        container.register(SigninViewModel.self) { _ in
            SigninViewModel()
        }

        // MainTab
        container.register(MainTabView.self) { resolver in
            MainTabView(
                homeView: resolver.resolve(HomeView.self)!,
                payView: resolver.resolve(PayView.self)!,
                historyView: resolver.resolve(HistoryView.self)!,
                myPageView: resolver.resolve(MyPageView.self)!
            )
        }

        // Feature
        container.register(HomeView.self) { resolver in
            HomeView(viewModel: resolver.resolve(HomeViewModel.self)!)
        }
        container.register(HomeViewModel.self) { _ in
            HomeViewModel()
        }
        container.register(PayView.self) { resolver in
            PayView(viewModel: resolver.resolve(PayViewModel.self)!)
        }
        container.register(PayViewModel.self) { _ in
            PayViewModel()
        }
        container.register(HistoryView.self) { resolver in
            HistoryView(viewModel: resolver.resolve(HistoryViewModel.self)!)
        }
        container.register(HistoryViewModel.self) { _ in
            HistoryViewModel()
        }
        container.register(MyPageView.self) { resolver in
            MyPageView(viewModel: resolver.resolve(MyPageViewModel.self)!)
        }
        container.register(MyPageViewModel.self) { _ in
            MyPageViewModel()
        }
    }
}
