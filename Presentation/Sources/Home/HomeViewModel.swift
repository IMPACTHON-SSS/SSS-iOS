import Foundation
import UIKit

public final class HomeViewModel: ObservableObject {
    @Published var isShowingMenu: Bool = true
    @Published var date: Date = .init()
}
