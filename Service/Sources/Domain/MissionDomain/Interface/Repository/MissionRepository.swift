import Foundation

public protocol MissionRepository {
    func fetchAllMission() async throws -> [MissionListEntity]
    func fetchMissionDetail() async throws -> MissionDetailEntity
    func createMission(request: CreateMissionRequestDTO) async throws
}
