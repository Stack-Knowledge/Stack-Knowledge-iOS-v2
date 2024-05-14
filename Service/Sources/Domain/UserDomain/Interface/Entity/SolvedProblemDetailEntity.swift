import Foundation

public struct SolvedProblemDetailEntity: Equatable {
    public let solveId: String
    public let solveTitle: String
    public let solution: String

    public init(
        solveId: String,
        solveTitle: String,
        solution: String
    ) {
        self.solveId = solveId
        self.solveTitle = solveTitle
        self.solution = solution
    }
}
