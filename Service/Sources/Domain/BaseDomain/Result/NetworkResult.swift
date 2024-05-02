import Foundation

public enum NetworkResult<T> {
    case success(T)
    case badRequest(T)
    case unauthorized
    case forbidden
    case internalServerError
}
