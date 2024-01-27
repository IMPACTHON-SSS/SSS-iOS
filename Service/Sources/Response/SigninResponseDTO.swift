import Foundation

public struct SigninResponseDTO: Decodable {
    public let accessToken: String

    public init(accessToken: String) {
        self.accessToken = accessToken
    }
}
