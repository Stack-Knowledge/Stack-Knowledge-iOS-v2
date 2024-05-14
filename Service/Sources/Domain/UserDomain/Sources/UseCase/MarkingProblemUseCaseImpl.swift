import Foundation

public struct MarkingProblemUseCaseImpl: MarkingProblemUseCase {
    private let userRepository: any UserRepository

    public init(userRepository: any UserRepository) {
        self.userRepository = userRepository
    }

    public func callAsFunction(solveId: String, approveStatus: ApproveStatusType) async throws {
        try await userRepository.markingProblem(solveId: solveId, approveStatus: approveStatus)
    }
}
