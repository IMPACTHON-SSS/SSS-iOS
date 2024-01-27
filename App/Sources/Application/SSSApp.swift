import SwiftUI
import Swinject
import Presentation
import Service

@main
struct SSSApp: App {
//    private let signinView: SigninView

    init() {
        _ = Assembler([
            PresentationDI()
        ], container: DI.container)

//        signinView = DI.container.resolve(SigninView.self)!
    }
    var body: some Scene {
        WindowGroup {
            Text("")
        }
    }
}
