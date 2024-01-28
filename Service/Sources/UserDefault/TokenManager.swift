import Foundation

public struct TokenManager {
    private enum UserDefaultsKey {
        static let accessToken = "AccessToken"
    }

    private static let userDefaults: UserDefaults = .standard

    public static func saveToken(token: String) {
        userDefaults.setValue(token, forKey: UserDefaultsKey.accessToken)
    }

    public static func getToken() -> String {
        let accessToken = userDefaults.string(forKey: UserDefaultsKey.accessToken)
        if let accessToken {
            return accessToken
        } else { return "" }
    }

    public static func removeToken() {
        userDefaults.removeObject(forKey: UserDefaultsKey.accessToken)
    }
}
