import SwiftUI
import SDS

public struct SuccessDiaryView: View {
    @StateObject var viewModel: SuccessDiaryViewModel

    public init(viewModel: SuccessDiaryViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        HomeNavigationTitle(isShowingMenu: $viewModel.isShowingMenu) {
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    Text("축하합니다!")
                        .font(.system(size: 24, weight: .bold))

                    HStack(spacing: 0) {
                        Text("3일 연속")
                            .foregroundColor(Color.blueColor)

                        Text("으로 일기를 올리셨어요!")
                    }
                    .font(.system(size: 24, weight: .bold))
                }

                Spacer()

                LargeButton("공유 하기") {
                    
                }
                .padding(.vertical, 24)
            }
        }
    }
}
