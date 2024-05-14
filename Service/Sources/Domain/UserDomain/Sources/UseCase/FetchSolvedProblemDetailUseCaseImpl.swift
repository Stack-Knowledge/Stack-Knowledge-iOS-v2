import Foundation

public struct FetchSolvedProblemDetailUseCaseImpl: FetchSolvedProblemDetailUseCase {
    private let userRepository: any UserRepository

    public init(userRepository: any UserRepository) {
        self.userRepository = userRepository
    }

    public func callAsFunction(solveId: String) async throws -> SolvedProblemDetailEntity {
        try await userRepository.fetchSolvedProblemDetail(solveId: solveId)
    }
}
