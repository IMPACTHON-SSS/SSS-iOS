import Foundation

public class SigninViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
}
