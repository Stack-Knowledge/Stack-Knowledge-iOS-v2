import Foundation

public struct LoginByTeacherUseCaseImpl: LoginByTeacherUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func callAsFunction(code: String) async throws {
        try await authRepository.loginByTeacher(code: code)
    }
}
