import SwiftUI
import AuthenticationServices
import SDS
import Service

public struct SigninView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: SigninViewModel

    public init(viewModel: SigninViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Spacer()

                PresentationAsset.logo.swiftUIImage

                Spacer()

                SignInWithAppleButton(.continue) { request in
                    request.requestedScopes = [.fullName, .email]
                } onCompletion: { result in
                    switch result {
                    case .success(let authResults):
                        print("Apple Login Successful")
                        guard let appleIDCredential = authResults.credential as? ASAuthorizationAppleIDCredential,
                              let identityToken = String(data: appleIDCredential.identityToken!, encoding: .utf8)
                        else { return }
                        print(identityToken)
                        viewModel.signin(token: identityToken) {
                            appState.sceneFlow = .home
                        } signupCompletion: {
                            viewModel.isNavigateToAgreement = true
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                        print("error")
                    }
                }
                .frame(height: 50)
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
                .background(.background)
            }
        }
        .navigate(to: AgreementView().environmentObject(appState), when: $viewModel.isNavigateToAgreement)
        .onAppear {
            TokenManager.removeToken()
        }
    }
}
