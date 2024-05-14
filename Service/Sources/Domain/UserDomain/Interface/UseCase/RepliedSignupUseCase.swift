import Foundation

public protocol RepliedSignupUseCase {
    func callAsFunction(userId: String, approveStatus: ApproveStatusType) async throws
}
