import Foundation

public protocol FetchRequestedSignupTeacherListUseCase {
    func callAsFunction() async throws -> [RequestedSignupTeacherListEntity]
}
