import SwiftUI
import SDS

public struct DiaryView: View {
    @State private var isNavigateShareView = false
    @State private var text: String = ""
    @State var image: UIImage?

    private let successDiaryView: SuccessDiaryView

    public init(
        successDiaryView: SuccessDiaryView
    ) {
        self.successDiaryView = successDiaryView
    }

    public var body: some View {
        NavigationBar {
            VStack(spacing: 24) {
                Image(uiImage: image ?? .init())
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 168)
                    .cornerRadius(12)
                    .padding(.top, 24)
                    .padding(.horizontal, 24)

                ZStack {
                    if text.isEmpty {
                        HStack(spacing: 1) {
                            Color.main
                                .frame(width: 2, height: 12)

                            Text("오늘의 요리는 어땠나요?")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(Color.gray4)
                        }
                    }

                    TextEditor(text: $text)
                        .font(.system(size: 14, weight: .medium))
                        .gridColumnAlignment(.leading)
                }
                .padding(.horizontal, 24)

                Spacer()

                LargeButton("일기 만들기") {
                    isNavigateShareView.toggle()
                }
            }
            .navigationBarBackButtonHidden()
            .navigate(to: successDiaryView, when: $isNavigateShareView)
        }
    }
}
