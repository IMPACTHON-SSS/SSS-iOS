import SwiftUI
import SDS

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 12) {
                Circle().frame(width: 43, height: 43)

                Text("프라이데이")
                    .font(.system(size: 16, weight: .semibold))

                Text("Apple로 로그인 중")
                    .font(.system(size: 14, weight: .medium))
            }

            VStack(alignment: .leading, spacing: 4) {
                EmptyView()
            }

            Spacer()

            logoutButton()
                .padding(.vertical, 12)
        }
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }

    @ViewBuilder
    func logoutButton() -> some View {
        Button {
            // 로그아웃
        } label: {
            Text("로그아웃")
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(Color.background)
                .padding(.vertical, 11)
                .frame(maxWidth: .infinity)
                .background(Color.gray8)
                .cornerRadius(8)
        }
    }
}
