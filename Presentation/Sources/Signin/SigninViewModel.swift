import Foundation

final class SigninViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
}
