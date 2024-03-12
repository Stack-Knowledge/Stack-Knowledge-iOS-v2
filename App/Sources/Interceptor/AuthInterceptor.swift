import Foundation
import Alamofire

class AuthInterceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        let keychain = DefaultKeychain()
        let access = keychain.load(key: "access_token")
        let refresh = keychain.load(key: "refresh_token")
        let expired = keychain.load(key: "access_token_expired")
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
         
        guard let tokenExpirationDate = formatter.date(from: expired) else { return completion(.success(urlRequest)) }

        if tokenExpirationDate < Date() {
            // TODO: 리프레시 토큰 코드 작성시 추가
                
            print("리프레쉬 adator 적용 \(urlRequest.headers)")
            completion(.success(urlRequest))
        } else {
            var urlRequest = urlRequest
            urlRequest.setValue(access, forHTTPHeaderField: "Authorization")
                
            print("기존 엑세스 adator 적용 \(urlRequest.headers)")
            completion(.success(urlRequest))
        }
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        // TODO: 리프레시 토큰 코드 작성시 추가
    }
}
