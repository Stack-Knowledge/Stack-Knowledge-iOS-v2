import Foundation

public struct LoginByStudentUseCaseImpl: LoginByStudentUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func callAsFunction(code: String) async throws {
        try await authRepository.loginByStudent(code: code)
    }
}
