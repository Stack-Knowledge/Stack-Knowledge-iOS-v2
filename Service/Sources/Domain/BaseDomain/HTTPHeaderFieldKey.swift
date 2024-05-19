import Foundation

public enum HTTPHeaderFieldKey: String {
    case contentType = "Content-Type"
    case authorization = "Authorization"
    case refreshToken = "RefreshToken"
}

public enum HTTPHeaderFieldValue: String {
    case json = "application/json"
    case accessToken
    case refreshToken
    case multipart = "multipart/form-data"
}

public enum HTTPHeaderType {
    case plain
    case accessToken
    case refreshToken
    case logout
    case imageUpload
}
