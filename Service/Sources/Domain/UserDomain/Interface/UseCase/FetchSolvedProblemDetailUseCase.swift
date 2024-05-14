import Foundation

public protocol FetchSolvedProblemDetailUseCase {
    func callAsFunction(solveId: String) async throws -> SolvedProblemDetailEntity
}
