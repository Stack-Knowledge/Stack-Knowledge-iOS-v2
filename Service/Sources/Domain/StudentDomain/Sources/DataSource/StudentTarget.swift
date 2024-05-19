import Foundation

import Alamofire

public enum StudentTarget {
    case fetchPointRankingList
    case fetchMyInfo
    case profileImageUpload(image: Data)
}

extension StudentTarget: TargetType {
    public var headerType: HTTPHeaderType {
        switch self {
        case .fetchPointRankingList,
             .fetchMyInfo:
            return .accessToken

        case .profileImageUpload(let image):
            return .imageUpload
        }
    }

    public var method: HTTPMethod {
        switch self {
        case .fetchPointRankingList,
             .fetchMyInfo:
            return .get

        case .profileImageUpload:
            return .post
        }
    }

    public var path: String {
        switch self {
        case .fetchPointRankingList:
            return "/student/ranking"

        case .fetchMyInfo:
            return "/student/my"

        case .profileImageUpload:
            return "/student/image"
        }
    }

    public var parameters: RequestParams {
        switch self {
        case .fetchPointRankingList,
             .fetchMyInfo:
            return .requestPlain

        case let .profileImageUpload(image):
            return .requestWithBody(image)
        }
    }
}
