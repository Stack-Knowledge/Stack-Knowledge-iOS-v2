import Foundation

import Alamofire

public enum OrderTarget {
    case orderItem(request: OrderItemRequestDTO)
    case fetchOrderedItem
    case changeItemState(request: ChangeItemStateRequestDTO)
}

extension OrderTarget: TargetType {
    public var headerType: HTTPHeaderType {
        switch self {
        case .orderItem,
             .fetchOrderedItem,
             .changeItemState:
            return .accessToken
        }
    }

    public var method: HTTPMethod {
        switch self {
        case .orderItem:
            return .post
        case .fetchOrderedItem:
            return .get
        case .changeItemState:
            return .patch
        }
    }

    public var path: String {
        switch self {
        case .orderItem,
             .fetchOrderedItem,
             .changeItemState:
            return "/order"
        }
    }

    public var parameters: RequestParams {
        switch self {
        case let .orderItem(request):
            return .requestWithBody(request)

        case .fetchOrderedItem:
            return .requestPlain

        case let .changeItemState(request):
            return .requestWithBody(request)
        }
    }
}
