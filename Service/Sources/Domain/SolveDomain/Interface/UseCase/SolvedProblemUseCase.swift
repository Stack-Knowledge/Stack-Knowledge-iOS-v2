import Foundation

public protocol SolvedProblemUseCase {
    func callAsFunction(missionId: String, solution: String) async throws
}
