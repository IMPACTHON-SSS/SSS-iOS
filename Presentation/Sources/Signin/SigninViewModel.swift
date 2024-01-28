import Foundation
import Service
import Sora

public final class SigninViewModel: ObservableObject {
    @Published var isNavigateToAgreement: Bool = false
    @MainActor
    func signin(
        token: String,
        signinCompletion: @escaping  () -> Void,
        signupCompletion: @escaping () -> Void
    ) {
        Task {
            do {
                let response = try await SigninRequest(body: .init(token: token))
                    .request(decodeWith: SigninResponseDTO.self, printResponse: true)
                TokenManager.saveToken(token: response.accessToken)
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
