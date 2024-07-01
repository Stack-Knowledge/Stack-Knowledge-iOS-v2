import Foundation

public struct FetchSolvedProblemListResponseDTO: Decodable {
    public let solveId: String
    public let solveStatus: SolveStatusType
    public let solveTitle: String
    public let point: Int
    public let user: FetchUserInfoResponseDTO

    enum CodingKeys: String, CodingKey {
        case solveId
        case solveStatus
        case solveTitle = "title"
        case point
        case user
    }
}

extension FetchSolvedProblemListResponseDTO {
    func toDomain() -> [SolvedProblemListEntity] {
        [SolvedProblemListEntity(
            solveId: solveId,
            solveStatus: solveStatus,
            solveTitle: solveTitle,
            point: point,
            user: user.toDomain()
        )]
    }
}
