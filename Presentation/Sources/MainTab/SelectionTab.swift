import SwiftUI

struct SelectionTabbKey: EnvironmentKey {
    static var defaultValue: Binding<TabFlow> = .constant(.home)
}

public extension EnvironmentValues {
    var selectionTabbKey: Binding<TabFlow> {
        get { self[SelectionTabbKey.self] }
        set { self[SelectionTabbKey.self] = newValue }
    }
}
