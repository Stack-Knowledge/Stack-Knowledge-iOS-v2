import Foundation

public protocol MarkingProblemUseCase {
    func callAsFunction(approveStatus: ApproveStatusType) async throws
}
