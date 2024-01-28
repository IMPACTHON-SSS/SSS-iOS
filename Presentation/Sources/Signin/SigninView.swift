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
                    case .success(let _):
                        viewModel.isNavigateToAgreement = true
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
    }
}
