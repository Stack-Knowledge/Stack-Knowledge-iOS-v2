import Foundation

enum HTTPHeaderFieldKey: String {
    case contentType = "Content-Type"
    case authorization = "Authorization"
    case refreshToken = "RefreshToken"
}

enum HTTPHeaderFieldValue: String {
    case json = "application/json"
    case accessToken
    case refreshToken
}

enum HTTPHeaderType {
    case plain
    case accessToken
    case refreshToken
    case logout
}
