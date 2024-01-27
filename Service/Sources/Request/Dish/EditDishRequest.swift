import Foundation
import Sora

public struct EditDishRequest: Requestable, Body {
    public var route = SSSService.path("dish", "2")
    public let method: RequestMethod = .patch

    public let body: Body

    public init(body: Body, route: ServiceType) {
        self.body = body
        self.route = route
    }

    public struct Body: Encodable {
        public let url: String
        public let dairy: String

        public init(url: String, dairy: String) {
            self.url = url
            self.dairy = dairy
        }
    }
}
