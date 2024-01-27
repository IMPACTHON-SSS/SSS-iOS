import Foundation
import Sora

public struct UploadImageRequest: Requestable, Body {
    public let route = SSSService.path("image")
    public let method: RequestMethod = .post

    public let body: Body

    public init(body: Body) {
        self.body = body
    }

    public struct Body: Encodable {
        public let file: String

        public init(file: String) {
            self.file = file
        }
    }
}
