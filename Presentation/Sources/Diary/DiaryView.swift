import SwiftUI
import SDS

public struct DiaryView: View {
    @State private var text: String = ""
    private let image: UIImage

    public init(image: UIImage) {
        self.image = image
    }

    public var body: some View {
        NavigationBar {
            VStack(spacing: 24) {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 168)
                    .cornerRadius(12)
                    .padding(.top, 24)
                    .padding(.horizontal, 24)

                Group {
                    if text.isEmpty {
                        HStack(spacing: 1) {
                            Color.main
                                .frame(width: 2, height: 12)

                            Text("오늘의 요리는 어땠나요?")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(Color.gray4)
                        }
                    } else {
                        TextEditor(text: $text)
                            .font(.system(size: 14, weight: .medium))
                            .gridColumnAlignment(.leading)
                    }
                }
                .padding(.horizontal, 24)

                Spacer()

                LargeButton("일기 만들기") {
                    // 일기만들기
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}
