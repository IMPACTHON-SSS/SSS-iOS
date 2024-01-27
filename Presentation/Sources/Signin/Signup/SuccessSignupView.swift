import SwiftUI
import SDS

struct SuccessSignupView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        VStack(alignment: .leading, spacing: 88) {
            Text("프라이데이에\n오신것을 환영합니다!")
                .font(.system(size: 24, weight: .semibold))
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 19)
                .padding(.top, 52)

            Image.onboarding
                .resizable()
                .frame(width: 356, height: 254)
                .padding(.horizontal, 19)

            Spacer()

            LargeButton("다음") {
                appState.sceneFlow = .home
            }
            .padding(.vertical, 12)
        }
        .navigationBarBackButtonHidden()
    }
}
