import SwiftUI
import SDS

public struct DiaryView: View {
    @EnvironmentObject var image: ImageModel
    @State private var isNavigateShareView = false
    @State private var text: String = ""

    private let successDiaryView: SuccessDiaryView

    public init(
        successDiaryView: SuccessDiaryView
    ) {
        self.successDiaryView = successDiaryView
    }

    public var body: some View {
        NavigationBar {
            VStack(spacing: 24) {
                Image(uiImage: image.image ?? .init())
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 168)
                    .cornerRadius(12)
                    .padding(.top, 24)
                    .padding(.horizontal, 24)

                ZStack(alignment: .topLeading) {
                    TextEditor(text: $text)
                        .font(.system(size: 14, weight: .medium))
                        .gridColumnAlignment(.leading)

                    if text.isEmpty {
                        HStack(spacing: 1) {
                            Color.main
                                .frame(width: 2, height: 12)

                            Text("오늘의 요리는 어땠나요?")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(Color.gray4)
                        }
                    }
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
