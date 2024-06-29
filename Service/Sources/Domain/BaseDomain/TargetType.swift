import Foundation

import Alamofire

public protocol TargetType: URLRequestConvertible {
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: RequestParams { get }
    var headerType: HTTPHeaderType { get }
}

extension TargetType {
    public var baseURL: String {
        return Bundle.module.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
    }

    var headers: [String: String]? {
        switch headerType {
        case .plain:
            return [HTTPHeaderFieldKey.contentType.rawValue: HTTPHeaderFieldValue.json.rawValue]

        case .accessToken:
            return [
                HTTPHeaderFieldKey.contentType.rawValue: HTTPHeaderFieldValue.json.rawValue,
                HTTPHeaderFieldKey.authorization.rawValue: "Bearer \(HTTPHeaderFieldValue.accessToken.rawValue)",
            ]

        case .refreshToken:
            return [
                HTTPHeaderFieldKey.contentType.rawValue: HTTPHeaderFieldValue.json.rawValue,
                HTTPHeaderFieldKey.refreshToken.rawValue: "Bearer \(HTTPHeaderFieldValue.refreshToken.rawValue)",
            ]

        case .logout:
            return [
                HTTPHeaderFieldKey.contentType.rawValue: HTTPHeaderFieldValue.json.rawValue,
                HTTPHeaderFieldKey.authorization.rawValue: "Bearer \(HTTPHeaderFieldValue.accessToken.rawValue)",
                HTTPHeaderFieldKey.refreshToken.rawValue: HTTPHeaderFieldValue.refreshToken.rawValue,
            ]
        }
    }
}

public extension TargetType {
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()
        let keychain = DefaultKeychain()

        var urlRequest = try URLRequest(
            url: url.appendingPathComponent(path),
            method: method
        )

        switch headerType {
        case .plain:
            urlRequest.setValue(HTTPHeaderFieldValue.json.rawValue, forHTTPHeaderField: HTTPHeaderFieldKey.contentType.rawValue)

        case .accessToken:
            urlRequest.setValue(HTTPHeaderFieldValue.json.rawValue, forHTTPHeaderField: HTTPHeaderFieldKey.contentType.rawValue)
            urlRequest.setValue("Bearer \(keychain.load(key: KeychainType.accessToken))", forHTTPHeaderField: HTTPHeaderFieldKey.authorization.rawValue)

        case .refreshToken:
            urlRequest.setValue(HTTPHeaderFieldValue.json.rawValue, forHTTPHeaderField: HTTPHeaderFieldKey.contentType.rawValue)
            urlRequest.setValue("Bearer \(keychain.load(key: KeychainType.refreshToken))", forHTTPHeaderField: HTTPHeaderFieldKey.refreshToken.rawValue)

        case .logout:
            urlRequest.setValue(HTTPHeaderFieldValue.json.rawValue, forHTTPHeaderField: HTTPHeaderFieldKey.contentType.rawValue)
            urlRequest.setValue("Bearer \(keychain.load(key: KeychainType.accessToken))", forHTTPHeaderField: HTTPHeaderFieldKey.authorization.rawValue)
            urlRequest.setValue(keychain.load(key: KeychainType.refreshToken), forHTTPHeaderField: HTTPHeaderFieldKey.refreshToken.rawValue)
        }

        switch parameters {
        case let .requestWithBody(request):
            let params = request?.toDictionary() ?? [:]
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)

        case let .requestQuery(request):
            let params = request?.toDictionary() ?? [:]
            let queryParams = params.map {
                URLQueryItem(name: $0.key, value: "\($0.value)")
            }
            var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            urlRequest.url = components?.url

        case let .requestQueryWithBody(queryRequest, bodyRequest):
            let params = queryRequest?.toDictionary() ?? [:]
            let queryParams = params.map {
                URLQueryItem(name: $0.key, value: "\($0.value)")
            }
            var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            urlRequest.url = components?.url

            let bodyParams = bodyRequest?.toDictionary() ?? [:]

            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: bodyParams)

        case .requestPlain:
            break
        }
        return urlRequest
    }
}

@frozen
public enum RequestParams {
    case requestPlain
    case requestWithBody(_ paramter: Encodable?)
    case requestQuery(_ parameter: Encodable?)
    case requestQueryWithBody(_ queryParameter: Encodable?, bodyParameter: Encodable?)
}

extension Encodable {
    func toDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self),
              let jsonData = try? JSONSerialization.jsonObject(with: data),
              let dictionaryData = jsonData as? [String: Any]
        else { return [:] }

        return dictionaryData
    }
}
