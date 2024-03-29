import Foundation
import Sora

public struct FetchDishRequest: Requestable, Body {
    public let route = SSSService.path("dish")
    public let method: RequestMethod = .get
    public let body: Body

    public init(body: Body) {
        self.body = body
    }

    public struct Body: Encodable {
        public let year: Int
        public let month: Int

        public init(year: Int, month: Int) {
            self.year = year
            self.month = month
        }
    }
}
