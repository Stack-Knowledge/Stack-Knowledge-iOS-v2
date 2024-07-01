import Foundation

public struct RemoteOrderDataSourceImpl: RemoteOrderDataSource {
    public init() {}

    public func orderItem(request: OrderItemRequestDTO) async throws {
        _ = try await API.session.request(OrderTarget.orderItem(request: request), interceptor: AuthInterceptor()).serializingString().value
    }

    public func fetchOrderedItem() async throws -> [OrderedItemEntity] {
        try await API.session.request(OrderTarget.fetchOrderedItem, interceptor: AuthInterceptor()).serializingDecodable(OrderedItemResponseDTO.self).value.toDomain()
    }

    public func changeItemState(request: ChangeItemStateRequestDTO) async throws {
        _ = try await API.session.request(OrderTarget.changeItemState(request: request), interceptor: AuthInterceptor()).serializingString().value
    }
}
