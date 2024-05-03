import Foundation

public struct FetchMissionDetailUseCaseImpl: FetchMissionDetailUseCase {
    private let missionRepository: any MissionRepository

    public init(missionRepository: any MissionRepository) {
        self.missionRepository = missionRepository
    }

    public func callAsFunction(missionId: String) async throws -> MissionDetailEntity {
        try await missionRepository.fetchMissionDetail(missionId: missionId)
    }
}
