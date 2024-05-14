import Foundation

public protocol MarkingProblemUseCase {
    func callAsFunction(solveId: String, approveStatus: ApproveStatusType) async throws
}
