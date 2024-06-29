import Foundation

public struct ChangeItemStateUseCaseImpl: ChangeItemStateUseCase {
    private let orderRepository: any OrderRepository

    public init(orderRepository: any OrderRepository) {
        self.orderRepository = orderRepository
    }

    public func callAsFunction(request: ChangeItemStateRequestDTO) async throws {
        try await orderRepository.changeItemState(request: request)
    }
}
