import Foundation

import Alamofire

public enum ItemTarget {
    case orderItem(request: OrderItemRequestDTO)
    case fetchOrderedItem
    case changeItemState(request: ChangeItemStateRequestDTO)
}

extension ItemTarget: TargetType {
    
}
