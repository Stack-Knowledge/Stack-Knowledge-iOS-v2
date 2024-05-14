import Foundation

import Alamofire

public enum SolveTarget {
    case solvedProblem(missionId: String, solution: String)
}

extension SolveTarget: TargetType {
    public var headerType: HTTPHeaderType {
        switch self {
        case .solvedProblem:
            return .accessToken
        }
    }

    public var method: HTTPMethod {
        switch self {
        case .solvedProblem:
            return .post
        }
    }

    public var path: String {
        switch self {
        case let .solvedProblem(missionId, _):
            return "/solve/\(missionId)"
        }
    }

    public var parameters: RequestParams {
        switch self {
        case let .solvedProblem(_, solution):
            return .requestWithBody(solution)
        }
    }
}
