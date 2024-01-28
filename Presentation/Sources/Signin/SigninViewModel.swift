import Foundation
import Service
import Sora

@MainActor
public final class SigninViewModel: ObservableObject {
    @Published var isNavigateToAgreement: Bool = false
}
