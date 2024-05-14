import Foundation

public struct SolvedProblemListEntity: Equatable {
    public let solveId: String
    public let solveStatus: SolveStatusType
    public let solveTitle: String
    public let point: Int
    public let user: UserInfoEntity

    public init(
        solveId: String,
        solveStatus: SolveStatusType,
        solveTitle: String,
        point: Int,
        user: UserInfoEntity
    ) {
        self.solveId = solveId
        self.solveStatus = solveStatus
        self.solveTitle = solveTitle
        self.point = point
        self.user = user
    }
}
