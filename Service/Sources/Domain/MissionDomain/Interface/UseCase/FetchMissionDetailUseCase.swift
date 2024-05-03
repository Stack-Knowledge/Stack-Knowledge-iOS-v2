import Foundation

public protocol FetchMissionDetailUseCase {
    func callAsFunction(missionId: String) async throws -> MissionDetailEntity
}
