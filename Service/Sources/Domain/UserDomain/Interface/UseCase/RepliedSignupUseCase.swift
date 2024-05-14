import Foundation

public protocol RepliedSignupUseCase {
    func callAsFunction(approveStatus: ApproveStatusType) async throws
}
