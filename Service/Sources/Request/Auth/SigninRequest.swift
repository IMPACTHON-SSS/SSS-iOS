import Foundation
import Sora

public struct SigninRequest: Requestable, Body {
    public let route = SSSService.path("auth", "login", "apple")
    public let method: RequestMethod = .post

    public let body: Body

    public init(body: Body) {
        self.body = body
    }

    public struct Body: Encodable {
        public let token: String

        public init(token: String) {
            self.token = token
        }
    }
}
