import Foundation

public struct MissionRepositoryImpl: MissionRepository {
    private let remoteMissionDataSource: any RemoteMissionDataSource

    public init(remoteMissionDataSource: any RemoteMissionDataSource) {
        self.remoteMissionDataSource = remoteMissionDataSource
    }

    public func fetchAllMission() async throws -> [MissionListEntity] {
        try await remoteMissionDataSource.fetchAllMission()
    }
    
    public func fetchMissionDetail(missionId: String) async throws -> MissionDetailEntity {
        try await remoteMissionDataSource.fetchMissionDetail(missionId: missionId)
    }
    
    public func createMission(request: CreateMissionRequestDTO) async throws {
        try await remoteMissionDataSource.createMission(request: request)
    }
}
