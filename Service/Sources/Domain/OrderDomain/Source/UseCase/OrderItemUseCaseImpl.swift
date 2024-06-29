import Foundation

public struct OrderItemUseCaseImpl: OrderItemUseCase {
    private let orderRepository: any OrderRepository

    public init(orderRepository: any OrderRepository) {
        self.orderRepository = orderRepository
    }

    public func callAsFunction(reqeust: OrderItemRequestDTO) async throws {
        try await orderRepository.orderItem(request: reqeust)
    }
}
