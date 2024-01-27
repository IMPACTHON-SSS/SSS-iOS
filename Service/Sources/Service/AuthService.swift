import Foundation
import Sora

public struct AuthService: Service {
    public let endpoint: URL = .init(string: "https://rollingapi.stubee.kr/")!
    public let path: [String]

    public init(path: [String]) {
        self.path = path
    }
}
