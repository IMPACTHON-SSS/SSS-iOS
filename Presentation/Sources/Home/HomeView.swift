import SwiftUI

public struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    public init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        VStack {
            Text("HomeView")

            Spacer()
        }
        .sideMenu(isShowing: $viewModel.isShowing) {
            Color.black.frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
        }
    }
}
