import SwiftUI
import SDS

public struct DiaryView: View {
    public var body: some View {
        NavigationBar {
            VStack(spacing: 0) {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 168)
                    .cornerRadius(12)
                    .padding(24)

                Spacer()

                LargeButton("일기 만들기") {
                    // 일기만들기
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}
