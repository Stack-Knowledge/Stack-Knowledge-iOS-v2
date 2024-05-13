import Foundation

public protocol LoginByTeacherUseCase {
    func callAsFunction(code: String) async throws
}
