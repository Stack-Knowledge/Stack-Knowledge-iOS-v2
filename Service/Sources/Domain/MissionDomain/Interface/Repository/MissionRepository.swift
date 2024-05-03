import Foundation

public protocol MissionRepository {
    func fetchAllMission() async throws -> [MissionListEntity]
    func fetchMissionDetail(missionId: String) async throws -> MissionDetailEntity
    func createMission(request: CreateMissionRequestDTO) async throws
}
