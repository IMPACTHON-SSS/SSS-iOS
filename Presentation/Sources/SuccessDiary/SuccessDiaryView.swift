import SwiftUI
import SDS

public struct SuccessDiaryView: View {
    @StateObject var viewModel: SuccessDiaryViewModel
    @State var image: UIImage?

    public init(viewModel: SuccessDiaryViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        HomeNavigationTitle(isShowingMenu: $viewModel.isShowingMenu) {
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("축하합니다!")
                        .font(.system(size: 24, weight: .bold))

                    HStack(spacing: 0) {
                        Text("3일 연속")
                            .foregroundColor(Color.blueColor)

                        Text("으로 일기를 올리셨어요!")
                    }
                    .font(.system(size: 24, weight: .bold))
                }
                .padding(.horizontal, 24)

                Spacer()

                Button {
                    Instagram(id: 422687533517853) {
                        Image(uiImage: image ?? .init())
                    }.open()
                } label: {
                    Text("공유 하기")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 17, weight: .semibold))
                        .padding(.vertical, 16)
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(12)
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}
