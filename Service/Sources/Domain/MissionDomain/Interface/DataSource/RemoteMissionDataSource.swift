import Foundation

public protocol RemoteMissionDataSource {
    func fetchAllMission() async throws -> [MissionListEntity]
    func fetchMissionDetail(missionId: String) async throws -> MissionDetailEntity
    func createMission(request: CreateMissionRequestDTO) async throws
}
