import SwiftUI
import SDS

struct AgreementView: View {
    @EnvironmentObject var appState: AppState
    @State private var isNavigateToSuccess = false
    @State private var isChecked = false
    @State private var isChecked1 = false
    @State private var isChecked2 = false
    @State private var isChecked3 = false
    @State private var isChecked4 = false

    var body: some View {
        NavigationBar {
            VStack(spacing: 24) {
                Spacer()

                Image.agreement
                    .resizable()
                    .frame(width: 225, height: 223)

                Spacer()

                VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 12) {
                        Checkbox(isChecked: $isChecked)
                            .onChange(of: isChecked) { newValue in
                                isChecked1 = newValue
                                isChecked2 = newValue
                                isChecked3 = newValue
                                isChecked4 = newValue
                            }

                        Text("약관 전체 동의")
                            .font(.system(size: 18))

                        Spacer()
                    }

                    Rectangle().fill(Color.gray4).frame(maxWidth: .infinity, maxHeight: 1)

                    AgreementButton(
                        "개인 정보 수집 및 이용 동의",
                        isChecked: $isChecked1
                    ) {}.required()

                    AgreementButton(
                        "프라이데이 이용약관 동의",
                        isChecked: $isChecked2
                    ) {}.required()

                    AgreementButton(
                        "광고성 정보 수신 동의",
                        isChecked: $isChecked3
                    ) {}

                    AgreementButton(
                        "개인정보 수집이용 동의",
                        isChecked: $isChecked4
                    ) {}
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)

                LargeButton("다음") {
                    isNavigateToSuccess = true
                }
                .disabled(!(isChecked1&&isChecked2))
                .padding(.vertical, 12)
            }
            .navigate(to: SuccessSignupView().environmentObject(appState), when: $isNavigateToSuccess)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    AgreementView()
}
