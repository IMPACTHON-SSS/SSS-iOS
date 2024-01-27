import Foundation

public struct SigninResponseDTO: Decodable {
    public let accessToken: String
    public let isFirstLogin: Bool

    public init(accessToken: String, isFirstLogin: Bool) {
        self.accessToken = accessToken
        self.isFirstLogin = isFirstLogin
    }
}
