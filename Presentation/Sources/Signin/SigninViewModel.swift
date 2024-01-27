import Foundation
import Service
import Sora

public final class SigninViewModel: ObservableObject {
    @Published var isNavigateToAgreement: Bool = false

    func signin(
        token: String,
        signinCompletion: @escaping  () -> Void,
        signupCompletion: @escaping () -> Void
    ) {
        Task {
            do {
                let response = try await PostLoginRequest(body: .init(token: token))
                    .request(decodeWith: SigninResponseDTO.self, printResponse: true)
                if response.isFirstLogin {
                    signupCompletion()
                } else {
                    signinCompletion()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
