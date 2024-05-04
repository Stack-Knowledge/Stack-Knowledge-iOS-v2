import Foundation

import Alamofire

public enum AuthTarget {
    case loginByStudent(code: String)
    case loginByTeacher(code: String)
    case refresh
    case logout
}

extension AuthTarget: TargetType {
    public var headerType: HTTPHeaderType {
        switch self {
        case .loginByStudent,
             .loginByTeacher:
            return .plain

        case .refresh:
            return .refreshToken

        case .logout:
            return .logout
        }
    }

    public var method: HTTPMethod {
        switch self {
        case .loginByStudent,
             .loginByTeacher:
            return .post

        case .refresh:
            return .patch

        case .logout:
            return .delete
        }
    }

    public var path: String {
        switch self {
        case .loginByStudent:
            return "/auth/student"

        case .loginByTeacher:
            return "/auth/teacher"

        case .refresh,
             .logout:
            return "/auth"
        }
    }

    public var parameters: RequestParams {
        switch self {
        case let .loginByStudent(code),
             let .loginByTeacher(code):
            return .requestWithBody(code)

        case .refresh,
             .logout:
            return .requestPlain
        }
    }
}
