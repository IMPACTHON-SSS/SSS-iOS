import SwiftUI

public struct SigninView: View {
    @StateObject var viewModel: SigninViewModel

    init(viewModel: SigninViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
         Text("Signin")
    }
}
