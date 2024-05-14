import Foundation

import Alamofire

public final class RemoteMissionDataSourceImpl: RemoteMissionDataSource {
    public init() {}

    public func fetchAllMission() async throws -> [MissionListEntity] {
        try await API.session.request(MissionTarget.fetchAllMission, interceptor: AuthInterceptor())
            .serializingDecodable(FetchAllMissionResponseDTO.self)
            .value.toDomain()
    }
    
    public func fetchMissionDetail(missionId: String) async throws -> MissionDetailEntity {
        try await API.session.request(MissionTarget.fetchMissionDetail(missionId: missionId), interceptor: AuthInterceptor())
            .serializingDecodable(FetchMissionDetailResponseDTO.self)
            .value.toDomain()
    }
    
    public func createMission(request: CreateMissionRequestDTO) async throws {
        _ = try await API.session.request(MissionTarget.createMission(request: request), interceptor: AuthInterceptor()).serializingString().value
    }
}
