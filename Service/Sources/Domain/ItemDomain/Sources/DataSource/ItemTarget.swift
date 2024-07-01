import Foundation

import Alamofire

public enum ItemTarget {
    case fetchItemList
}

extension ItemTarget: TargetType {
    public var headerType: HTTPHeaderType {
        switch self {
        case .fetchItemList:
            return .accessToken
        }
    }

    public var method: HTTPMethod {
        switch self {
        case .fetchItemList:
            return .get
        }
    }

    public var path: String {
        switch self {
        case .fetchItemList:
            return "/item"
        }
    }

    public var parameters: RequestParams {
        switch self {
        case .fetchItemList:
            return .requestPlain
        }
    }
}
