import Foundation

import Alamofire

public enum UserTarget {
    case fetchSolvedProblemList
    case fetchSolvedProblemDetail(solveId: String)
    case fetchRequestedSignupTeacherList
    case markingProblem(solveId: String, approveStatus: ApproveStatusType)
    case repliedSignup(userId: String, approveStatus: ApproveStatusType)
}

extension UserTarget: TargetType {
    public var headerType: HTTPHeaderType {
        switch self {
        case .fetchSolvedProblemList,
             .fetchSolvedProblemDetail,
             .fetchRequestedSignupTeacherList,
             .markingProblem,
             .repliedSignup:
            return .accessToken
        }
    }

    public var method: HTTPMethod {
        switch self {
        case .fetchSolvedProblemList,
             .fetchSolvedProblemDetail,
             .fetchRequestedSignupTeacherList:
            return .get

        case .markingProblem:
            return .post

        case .repliedSignup:
            return .patch
        }
    }

    public var path: String {
        switch self {
        case .fetchSolvedProblemList:
            return "/user/scoring"

        case let .fetchSolvedProblemDetail(solveId):
            return "/user/scoring/\(solveId)"

        case .fetchRequestedSignupTeacherList:
            return "/user/teacher"

        case let .markingProblem(solveId, _):
            return "/user/scoring/\(solveId)"

        case let .repliedSignup(userId, _):
            return "/user/\(userId)"
        }
    }

    public var parameters: RequestParams {
        switch self {
        case .fetchSolvedProblemList,
             .fetchSolvedProblemDetail,
             .fetchRequestedSignupTeacherList:
            return .requestPlain

        case let .markingProblem(_, approveStatus),
             let .repliedSignup(_, approveStatus):
            return .requestWithBody(approveStatus)
        }
    }
}
