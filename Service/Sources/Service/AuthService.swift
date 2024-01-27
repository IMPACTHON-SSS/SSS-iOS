import Foundation
import Sora

public struct AuthService: Service {
    public var endpoint: URL {
        .init(
            string: Bundle.module.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
        ) ?? URL(string: "https://www.google.com")!
    }
    public let path: [String]

    public init(path: [String]) {
        self.path = path
    }
}

private class BundleFinder {}

extension Foundation.Bundle {
    static let module = Bundle(for: BundleFinder.self)
}
