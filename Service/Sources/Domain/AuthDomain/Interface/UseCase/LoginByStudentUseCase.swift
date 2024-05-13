import Foundation

public protocol LoginByStudentUseCase {
    func callAsFunction(code: String) async throws
}
