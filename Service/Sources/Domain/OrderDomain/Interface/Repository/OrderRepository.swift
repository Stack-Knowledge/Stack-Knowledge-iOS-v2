import Foundation

public protocol OrderRepository {
    func orderItem(request: OrderItemRequestDTO) async throws
    func fetchOrderedItem() async throws -> [OrderedItemEntity]
    func changeItemState(request: ChangeItemStateRequestDTO) async throws
}
