import Foundation
import Service
import Sora

public final class SigninViewModel: ObservableObject {

    func signin(token: String) {
        Task {
            do {
                let response = try await PostLoginRequest(body: .init(token: token))
                    .request(decodeWith: SigninResponseDTO.self, printResponse: true)
                TokenManager.saveToken(token: response.accessToken)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
