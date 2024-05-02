import Foundation

public protocol CreateMissionUseCase {
    func callAsFunction(request: CreateMissionRequestDTO) async throws
}
