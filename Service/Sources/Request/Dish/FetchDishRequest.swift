import Foundation
import Sora

public struct FetchDishRequest: Requestable, Body {
    public let route = SSSService.path("dish", "2024", "01")
    public let method: RequestMethod = .get
    
    public let body: Body
    
    public init(body: Body) {
        self.body = body
    }
    
    public struct Body: Encodable {
        public let year: Int
        public let month: Int
    }
}
