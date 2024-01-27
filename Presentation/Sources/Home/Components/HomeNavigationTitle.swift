import SwiftUI
import SDS

struct HomeNavigationTitle<C: View>: View {
    @Binding var isShowingMenu: Bool
    let content: () -> C

    init(
        isShowingMenu: Binding<Bool>,
        @ViewBuilder content: @escaping () -> C
    ) {
        _isShowingMenu = isShowingMenu
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image.title
                    .resizable()
                    .frame(width: 120, height: 25)

                Spacer()

                Image.menu
                    .resizable()
                    .frame(width: 24, height: 24)
                    .onTapGesture {
                        isShowingMenu.toggle()
                    }
            }
            .padding(.vertical, 13.5)
            .padding(.horizontal, 24)

            content()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color.background)
        .sideMenu(isShowing: $isShowingMenu) {
            SideMenuView()
        }
    }
}
