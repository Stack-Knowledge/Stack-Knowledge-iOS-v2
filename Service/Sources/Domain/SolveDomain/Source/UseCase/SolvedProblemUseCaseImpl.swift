import Foundation

public struct SolvedProblemUseCaseImpl: SolvedProblemUseCase {
    private let solveRepository: any SolveRepository

    public init(solveRepository: any SolveRepository) {
        self.solveRepository = solveRepository
    }

    public func callAsFunction(missionId: String, solution: String) async throws {
        try await solveRepository.solvedProblem(missionId: missionId, solution: solution)
    }
}
