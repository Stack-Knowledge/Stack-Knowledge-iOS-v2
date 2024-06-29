import Foundation

public protocol SolveRepository {
    func solvedProblem(missionId: String, solution: String) async throws
}
