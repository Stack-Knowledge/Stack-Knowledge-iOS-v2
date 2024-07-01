import Foundation

public struct OrderRepositoryImpl: OrderRepository {
    private let remoteOrderDataSource: any RemoteOrderDataSource

    public init(remoteOrderDataSource: any RemoteOrderDataSource) {
        self.remoteOrderDataSource = remoteOrderDataSource
    }

    public func orderItem(request: OrderItemRequestDTO) async throws {
        try await remoteOrderDataSource.orderItem(request: request)
    }

    public func fetchOrderedItem() async throws -> [OrderedItemEntity] {
        try await remoteOrderDataSource.fetchOrderedItem()
    }

    public func changeItemState(request: ChangeItemStateRequestDTO) async throws {
        try await remoteOrderDataSource.changeItemState(request: request)
    }
}
