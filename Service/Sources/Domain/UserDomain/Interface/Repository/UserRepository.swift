import Foundation

public protocol UserRepository {
    func fetchSolvedProblemList() async throws -> [SolvedProblemListEntity]
    func fetchSolvedProblemDetail(solveId: String) async throws -> SolvedProblemDetailEntity
    func fetchRequestedSignupTeacherList() async throws -> [RequestedSignupTeacherListEntity]
    func markingProblem(solveId: String, approveStatus: ApproveStatusType) async throws
    func repliedSignup(userId: String, approveStatus: ApproveStatusType) async throws
}
