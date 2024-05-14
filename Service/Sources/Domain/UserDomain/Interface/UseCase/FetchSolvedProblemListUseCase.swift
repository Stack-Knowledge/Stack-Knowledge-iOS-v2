import Foundation

public protocol FetchSolvedProblemListUseCase {
    func callAsFunction() async throws -> [SolvedProblemListEntity]
}
