import Foundation

public struct FetchSolvedProblemListUseCaseImpl: FetchSolvedProblemListUseCase {
    private let userRepository: any UserRepository

    public init(userRepository: any UserRepository) {
        self.userRepository = userRepository
    }

    public func callAsFunction() async throws -> [SolvedProblemListEntity] {
        try await userRepository.fetchSolvedProblemList()
    }
}
