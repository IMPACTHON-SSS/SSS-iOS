import SwiftUI

public extension View {
    func sideMenu<MenuContent: View>(
        isShowing: Binding<Bool>,
        @ViewBuilder menuContent: @escaping () -> MenuContent
    ) -> some View {
        self.modifier(SideMenu(isShowing: isShowing, menuContent: menuContent))
    }
}

public struct SideMenu<MenuContent: View>: ViewModifier {
    @State private var opacity: CGFloat = 0
    @State private var offset: CGFloat = 0
    @Binding var isShowing: Bool
    private let menuContent: () -> MenuContent

    public init(
        isShowing: Binding<Bool>,
        @ViewBuilder menuContent: @escaping () -> MenuContent
    ) {
        _isShowing = isShowing
        self.menuContent = menuContent
    }

    public func body(content: Content) -> some View {
        return GeometryReader { proxy in
            let menuWidth = proxy.size.width * 2 / 3

            ZStack(alignment: .trailing) {
                content
                    .disabled(isShowing)
                    .frame(width: proxy.size.width, height: proxy.size.height)

                Color.black.opacity(opacity)
                    .ignoresSafeArea()
                    .onTapGesture {
                        self.isShowing = false
                    }
                    .disabled(!isShowing)

                menuContent()
                    .frame(width: menuWidth)
                    .offset(x: offset)
                    .gesture(
                        DragGesture()
                            .onChanged { event in
                                if event.location.x > 0 {
                                    withAnimation {
                                        self.setOpacity(proxy: proxy)
                                        self.offset = event.location.x
                                    }
                                }
                            }
                            .onEnded { event in
                                withAnimation {
                                    self.isShowing = event.location.x < menuWidth/2
                                    self.offset = event.location.x < menuWidth/2 ? 0: menuWidth
                                    self.opacity = isShowing ? 0.5: 0
                                }
                            }
                        )
            }
            .onAppear {
                offset = menuWidth
            }
            .onChange(of: isShowing) { newValue in
                withAnimation {
                    self.offset = newValue ? 0: menuWidth
                    self.opacity = newValue ? 0.5: 0
                }
            }
        }
    }

    private func setOpacity(proxy: GeometryProxy) {
        self.opacity = (proxy.size.width - offset) / proxy.size.width - 0.5
    }
}
