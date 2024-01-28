import Foundation
import Service

public final class SplashViewModel: ObservableObject {
    @MainActor
    func onAppear(
        completion: @escaping () -> Void,
        onError: @escaping () -> Void
    ) {
        let token = TokenManager.getToken()
        guard !token.isEmpty else {
            onError()
            return
        }
        Task {
            do {
                print(token)
                TokenManager.removeToken()
                let response = try await SigninRequest(body: .init(token: token))
                    .request(decodeWith: SigninResponseDTO.self, printResponse: true)
                TokenManager.saveToken(token: response.accessToken)

                completion()
            } catch {
                print(error.localizedDescription)
                onError()
            }
        }
    }
}
