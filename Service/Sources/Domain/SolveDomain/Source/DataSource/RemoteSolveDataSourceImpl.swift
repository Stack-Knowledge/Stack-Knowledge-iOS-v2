import Foundation

public struct RemoteSolveDataSourceImpl: RemoteSolveDataSource {
    public init() {}

    public func solvedProblem(missionId: String, solution: String) async throws {
        _ = try await API.session.request(SolveTarget.solvedProblem(missionId: missionId, solution: solution), interceptor: AuthInterceptor())
            .serializingString().value
    }
}
