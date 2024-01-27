import SwiftUI

struct HistoryView: View {
    @StateObject var viewModel: HistoryViewModel

    init(viewModel: HistoryViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
         Text("HistoryView")
    }
}
