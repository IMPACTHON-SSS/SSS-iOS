import Foundation

final class SigninViewModel: ObservableObject {
    func signin(token: String) {
        print("token:", token)
    }
}
