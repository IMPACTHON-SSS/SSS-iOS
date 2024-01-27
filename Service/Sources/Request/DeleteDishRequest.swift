import Foundation
import Sora

public struct DeleteDishRequest: Requestable {
    public var route = SSSService.path("dish", "2")
    public let method: RequestMethod = .delete
    
    init(route: ServiceType) {
        self.route = route
    }
}
