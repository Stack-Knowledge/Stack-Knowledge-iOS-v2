import Foundation

public struct SolveRepositoryImpl: SolveRepository {
    private let remoteSolveDataSource: any RemoteSolveDataSource

    public init(remoteSolveDataSource: any RemoteSolveDataSource) {
        self.remoteSolveDataSource = remoteSolveDataSource
    }

    public func solvedProblem(missionId: String, solution: String) async throws {
        try await remoteSolveDataSource.solvedProblem(missionId: missionId, solution: solution)
    }
}
