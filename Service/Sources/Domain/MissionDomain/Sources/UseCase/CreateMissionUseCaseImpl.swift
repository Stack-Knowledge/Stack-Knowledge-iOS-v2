import Foundation

public struct CreateMissionUseCaseImpl: CreateMissionUseCase {
    private let missionRepository: any MissionRepository

    public init(missionRepository: any MissionRepository) {
        self.missionRepository = missionRepository
    }

    public func callAsFunction(request: CreateMissionRequestDTO) async throws {
        try await missionRepository.createMission(request: request)
    }
}
