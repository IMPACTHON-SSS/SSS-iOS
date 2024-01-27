import Foundation
import Sora

public struct AddDishRequest: Requestable, Body {
    public let route = SSSService.path("dish")
    public let method: RequestMethod = .post
    
    public let body: Body
    
    init(body: Body) {
        self.body = body
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
