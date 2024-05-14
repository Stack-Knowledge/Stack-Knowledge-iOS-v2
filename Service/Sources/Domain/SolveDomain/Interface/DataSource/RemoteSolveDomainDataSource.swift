import Foundation

public protocol RemoteSolveDomainDataSource {
    func solvedProblem(missionId: String, solution: String) async throws
}
