import SwiftUI
import SDS

public struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    public init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        HomeNavigationTitle(isShowingMenu: $viewModel.isShowingMenu) {
            VStack(alignment: .leading, spacing: 24) {
                Text("‘프라이데이'님!\n3일 연속으로 까먹지 않으셨네요!")
                    .font(.system(size: 24, weight: .bold))
                    .padding(.vertical, 24)

                VStack(alignment: .leading, spacing: 0) {
                    Text("2024년 1월")
                        .font(.system(size: 17, weight: .semibold))
                        .padding(.bottom, 12)
                        .padding(.top, 10)

                    DateGridView(
                        dateGrids: [
                        ],
                        yearAndMonth: viewModel.date
                    ) { day in
                        print(day)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 5)
                .padding(.bottom, 2)
                .background(Color.gray1)
                .cornerRadius(13)

                Spacer()

                LargeButton("일기 만들기") {
                    // 카메라 띄우기
                }
                .padding(.vertical, 12)
            }
            .padding(.horizontal, 24)
        }
        .onOpenURL { url in
            if url == URL(string: "widget://camera")! {
                
            }
        }
    }
}
