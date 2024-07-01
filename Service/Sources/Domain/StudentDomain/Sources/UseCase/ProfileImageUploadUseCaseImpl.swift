import Foundation

public struct ProfileImageUploadUseCaseImpl: ProfileImageUploadUseCase {
    private let studentRepository: any StudentRepository

    public init(studentRepository: any StudentRepository) {
        self.studentRepository = studentRepository
    }

    public func callAsFunction(image: Data) async throws -> String {
        try await studentRepository.profileImageUpload(image: image)
    }
}
