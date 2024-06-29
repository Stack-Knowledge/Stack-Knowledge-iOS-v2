import Foundation

public protocol RemoteSolveDataSource {
    func solvedProblem(missionId: String, solution: String) async throws
}
