import Foundation

public struct RepliedSignupUseCaseImpl: RepliedSignupUseCase {
    private let userRepository: any UserRepository

    public init(userRepository: any UserRepository) {
        self.userRepository = userRepository
    }

    public func callAsFunction(userId: String, approveStatus: ApproveStatusType) async throws {
        try await userRepository.repliedSignup(userId: userId, approveStatus: approveStatus)
    }
}
