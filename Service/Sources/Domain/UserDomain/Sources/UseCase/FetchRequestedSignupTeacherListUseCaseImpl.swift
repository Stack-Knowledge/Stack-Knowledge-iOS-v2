import Foundation

public struct FetchRequestedSignupTeacherListUseCaseImpl: FetchRequestedSignupTeacherListUseCase {
    private let userRepository: any UserRepository

    public init(userRepository: any UserRepository) {
        self.userRepository = userRepository
    }

    public func callAsFunction() async throws -> [RequestedSignupTeacherListEntity] {
        try await userRepository.fetchRequestedSignupTeacherList()
    }
}
