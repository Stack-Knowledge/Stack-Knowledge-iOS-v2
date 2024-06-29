import Foundation

public protocol ChangeItemStateUseCase {
    func callAsFunction(request: ChangeItemStateRequestDTO) async throws
}
