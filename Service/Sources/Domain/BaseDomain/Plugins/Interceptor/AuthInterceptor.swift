import Foundation

import Alamofire

class AuthInterceptor: RequestInterceptor {
    let keychain = DefaultKeychain()

    let retryLimit = 3
    let retryDelay: TimeInterval = 1

    func adapt(_ urlRequest: URLRequest, for _: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        let access = keychain.load(key: KeychainType.accessToken)
        let refresh = keychain.load(key: KeychainType.refreshToken)
        let expired = keychain.load(key: KeychainType.expiredAt)

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        guard let tokenExpirationDate = formatter.date(from: expired) else {
            return completion(.success(urlRequest))
        }

        if tokenExpirationDate < Date() {
            AF.request(
                URL(string: Bundle.module.object(forInfoDictionaryKey: "BASE_URL") as? String ?? "") ?? URL(string: "https://www.google.com%22%29%21/")!,
                method: .patch,
                headers: [
                    "RefreshToken": refresh,
                ]
            )
            .validate(statusCode: 200 ..< 300)
            .responseData { response in
                switch response.result {
                case let .success(data):
                    let jsonDecoder = JSONDecoder()
                    do {
                        let tokenResponse = try jsonDecoder.decode(TokenResponseDTO.self, from: data)
                        self.keychain.save(key: KeychainType.accessToken, value: tokenResponse.accessToken)
                        self.keychain.save(key: KeychainType.refreshToken, value: tokenResponse.refreshToken)
                        self.keychain.save(key: KeychainType.expiredAt, value: tokenResponse.expiredAt)
                        var urlRequest = urlRequest
                        urlRequest.setValue(tokenResponse.accessToken, forHTTPHeaderField: "Authorization")
                        print("리프레시 어댑터 적용 \(urlRequest.headers)")
                        completion(.success(urlRequest))
                    } catch {
                        print("토큰 응답 디코딩 실패: \(error)")
                        completion(.failure(error))
                    }
                case let .failure(error):
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
        } else {
            var urlRequest = urlRequest
            urlRequest.setValue(access, forHTTPHeaderField: "Authorization")
            print("기존 엑세스 어댑터 적용 \(urlRequest.headers)")
            completion(.success(urlRequest))
        }
    }

    func retry(_ request: Request, for _: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        print("retry 진입")

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        guard let response = request.task?.response as? HTTPURLResponse else {
            completion(.doNotRetryWithError(error))
            return
        }

        if response.statusCode == 401 {
            let access = keychain.load(key: KeychainType.accessToken)
            let refresh = keychain.load(key: KeychainType.refreshToken)
            let expired = keychain.load(key: KeychainType.expiredAt)

            if refresh.isEmpty {
                print("refresh token 만료")
                NotificationCenter.default.post(name: Notification.Name("refreshTokenExpired"), object: nil, userInfo: ["showLoginModal": true])
                return completion(.doNotRetry)
            }

            keychain.save(key: KeychainType.accessToken, value: refresh)
            keychain.save(key: KeychainType.expiredAt, value: formatter.string(from: Date()))

            if request.retryCount < retryLimit {
                print("재시도 시도 중...")
                return completion(.retryWithDelay(retryDelay))
            } else {
                print("재시도 횟수 초과")
                return completion(.doNotRetry)
            }
        } else {
            return completion(.doNotRetry)
        }
    }
}

struct TokenResponseDTO: Decodable {
    let accessToken: String
    let refreshToken: String
    let expiredAt: String
}

private class BundleFinder {}

extension Foundation.Bundle {
    static let module = Bundle(for: BundleFinder.self)
}
