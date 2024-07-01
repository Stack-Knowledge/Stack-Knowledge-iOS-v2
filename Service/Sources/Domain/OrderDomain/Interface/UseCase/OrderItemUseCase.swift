import Foundation

public protocol OrderItemUseCase {
    func callAsFunction(reqeust: OrderItemRequestDTO) async throws
}
