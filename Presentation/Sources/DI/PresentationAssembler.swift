import Foundation
import Swinject

public final class PresentationDI: Assembly {
    public init() {}

    public func assemble(container: Container) {
        container.register(SigninView.self) { resolver in
            SigninView(viewModel: resolver.resolve(SigninViewModel.self)!)
        }
        container.register(SigninViewModel.self) { _ in
            SigninViewModel()
        }
    }
}
