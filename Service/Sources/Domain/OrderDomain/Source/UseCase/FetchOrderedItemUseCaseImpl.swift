import Foundation

public struct FetchOrderedItemUseCaseImpl: FetchOrderedItemUseCase {
    private let orderRepository: any OrderRepository

    public init(orderRepository: any OrderRepository) {
        self.orderRepository = orderRepository
    }

    public func callAsFunction() async throws -> [OrderedItemEntity] {
        try await orderRepository.fetchOrderedItem()
    }
}
