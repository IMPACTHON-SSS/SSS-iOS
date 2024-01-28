import SwiftUI
import SDS

public struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    private var diaryView: DiaryView

    public init(viewModel: HomeViewModel, diaryView: DiaryView) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.diaryView = diaryView
    }

    @MainActor
    public var body: some View {
        HomeNavigationTitle(isShowingMenu: $viewModel.isShowingMenu) {
            VStack(alignment: .leading, spacing: 24) {
                Text("‘프라이데이'님!\n3일 연속으로 까먹지 않으셨네요!")
                    .font(.system(size: 24, weight: .bold))
                    .padding(.vertical, 24)
                    .padding(.horizontal, 24)

                VStack(alignment: .leading, spacing: 0) {
                    Text("2024년 1월")
                        .font(.system(size: 17, weight: .semibold))
                        .padding(.bottom, 12)
                        .padding(.top, 10)

                    DateGridView(
                        dateGrids: viewModel.dishList.map { .asyncImage($0.date.day, .init(string: $0.url)) },
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
                .padding(.horizontal, 24)

                Spacer()

                LargeButton("일기 만들기") {
                    DispatchQueue.main.async {
                        viewModel.isPresented = true
                    }
                }
                .padding(.vertical, 12)
            }
        }
        .onOpenURL { url in
            if url == URL(string: "widget://camera")! {
                viewModel.isPresented = true
            }
        }
        .onAppear(perform: viewModel.onAppear)
        .sheet(isPresented: $viewModel.isPresented) {
            CameraView($viewModel.image)
                .background(Color.black.ignoresSafeArea())
                .onDisappear {
                    viewModel.isNavigateToDiary = true
                    diaryView.image = viewModel.image
                }
        }
        .navigate(to: diaryView, when: $viewModel.isNavigateToDiary)
    }
}

extension String {
    var day: Int {
        Int(self.components(separatedBy: "-").last!)!
    }
}
