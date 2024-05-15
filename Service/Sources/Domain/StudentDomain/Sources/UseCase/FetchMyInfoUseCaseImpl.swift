import Foundation

public struct FetchMyInfoUseCaseImpl: FetchMyInfoUseCase {
    private let studentRepository: any StudentRepository

    public init(studentRepository: any StudentRepository) {
        self.studentRepository = studentRepository
    }

    public func callAsFunction() async throws -> MyInfoEntity {
        try await studentRepository.fetchMyInfo()
    }
}
