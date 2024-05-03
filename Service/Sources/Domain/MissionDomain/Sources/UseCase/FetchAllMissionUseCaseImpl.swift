import Foundation

public struct FetchAllMissionUseCaseImpl: FetchAllMissionUseCase {
    private let missionRepository: any MissionRepository

    public init(missionRepository: any MissionRepository) {
        self.missionRepository = missionRepository
    }

    public func callAsFunction() async throws -> [MissionListEntity] {
        try await missionRepository.fetchAllMission()
    }
}
