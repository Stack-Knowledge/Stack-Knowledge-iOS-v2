import Foundation

public protocol FetchAllMissionUseCase {
    func callAsFunction() async throws -> [MissionListEntity]
}
