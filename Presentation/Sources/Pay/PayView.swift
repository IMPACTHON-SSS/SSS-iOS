import SwiftUI

struct PayView: View {
    @StateObject var viewModel: PayViewModel

    init(viewModel: PayViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
         Text("PayView")
    }
}
