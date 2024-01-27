import Sora
import Foundation
import Alamofire

struct Interceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest,
               for session: Session,
               completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.timeoutInterval = 30
        let accessToken = TokenManager.getToken()
        urlRequest.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        completion(.success(urlRequest))
    }
}
