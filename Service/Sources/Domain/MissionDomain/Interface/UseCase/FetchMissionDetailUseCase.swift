import Foundation

public protocol FetchMissionDetailUseCase {
    func callAsFunction() async throws -> MissionDetailEntity
}
