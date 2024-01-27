import SwiftUI
import SDS
import UIKit

struct MainTabView: View {
    @State var selection: TabFlow = .home
    @State var tabbarHidden = false

    // swiftlint: disable large_tuple
    var tabItem: [(Image, String, TabFlow)] = [
        (.home, "홈", .home),
        (.creditCard, "페이", .pay),
        (.receipt, "주문내역", .history),
        (.person, "마이", .myPage)
    ]
    // swiftlint: enable large_tuple

    private let homeView: HomeView
    private let payView: PayView
    private let historyView: HistoryView
    private let myPageView: MyPageView

    init(
        homeView: HomeView,
        payView: PayView,
        historyView: HistoryView,
        myPageView: MyPageView
    ) {
        self.homeView = homeView
        self.payView = payView
        self.historyView = historyView
        self.myPageView = myPageView
    }

    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                homeView
                    .toNavigationView()
                    .eraseToAnyView()
                    .tag(TabFlow.home)

                payView
                    .toNavigationView()
                    .eraseToAnyView()
                    .tag(TabFlow.pay)

                historyView
                    .toNavigationView()
                    .eraseToAnyView()
                    .tag(TabFlow.history)

                myPageView
                    .toNavigationView()
                    .eraseToAnyView()
                    .tag(TabFlow.myPage)
            }
            .environment(\.tabbarHidden, $tabbarHidden)

            if !tabbarHidden {
                VStack {
                    Spacer()

                    tabbarView()
                        .background {
                            Color.modifyGray
                                .cornerRadius(10, corners: [.topLeft, .topRight])
                                .ignoresSafeArea()
                        }
                        .environment(\.selectionTabbKey, $selection)
                }
            }
        }
        .onChange(of: tabbarHidden) { _ in
            UITabBar.hideTabBar()
        }
        .environment(\.selectionTabbKey, $selection)
    }

    @ViewBuilder
    func tabbarView() -> some View {
        HStack {
            Spacer()

            ForEach(tabItem, id: \.1) { image, title, tag in
                tabItemView(image: image, title: title, tag: tag)
                    .frame(width: 56, height: 60)

                Spacer()
            }
        }
    }

    @ViewBuilder
    func tabItemView(image: Image, title: String, tag: TabFlow) -> some View {
        Button {
            withAnimation {
                selection = tag
            }
        } label: {
            VStack(spacing: 1) {
                image
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(tag == selection ? .main : .gray5)
                    .frame(width: 24, height: 24)

                if tag == selection {
                    Text(title)
                        .font(.system(size: 12))
                        .foregroundColor(tag == selection ? .main : .gray5)
                }
            }
            .padding(.vertical, 18)
        }
    }
}

extension View {
    func toNavigationView() -> any View {
        NavigationView {
            self
        }
        .navigationViewStyle(.stack)
    }

    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
