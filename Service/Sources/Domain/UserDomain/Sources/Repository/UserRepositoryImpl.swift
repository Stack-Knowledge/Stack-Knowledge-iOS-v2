import Foundation

public struct UserRepositoryImpl: UserRepository {
    private let remoteUserDatasource: RemoteUserDataSource

    public init(remoteUserDatasource: RemoteUserDataSource) {
        self.remoteUserDatasource = remoteUserDatasource
    }

    public func fetchSolvedProblemList() async throws -> [SolvedProblemListEntity] {
        try await remoteUserDatasource.fetchSolvedProblemList()
    }

    public func fetchSolvedProblemDetail(solveId: String) async throws -> SolvedProblemDetailEntity {
        try await remoteUserDatasource.fetchSolvedProblemDetail(solveId: solveId)
    }

    public func fetchRequestedSignupTeacherList() async throws -> [RequestedSignupTeacherListEntity] {
        try await remoteUserDatasource.fetchRequestedSignupTeacherList()
    }

    public func markingProblem(solveId: String, approveStatus: ApproveStatusType) async throws {
        try await remoteUserDatasource.markingProblem(solveId: solveId, approveStatus: approveStatus)
    }

    public func repliedSignup(userId: String, approveStatus: ApproveStatusType) async throws {
        try await remoteUserDatasource.repliedSignup(userId: userId, approveStatus: approveStatus)
    }
}
