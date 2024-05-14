import Foundation

public struct FetchSolvedProblemDetailResponseDTO: Decodable {
    public let solveId: String
    public let solveTitle: String
    public let solution: String

    enum CodingKeys: String, CodingKey {
        case solveId
        case solveTitle = "title"
        case solution
    }
}

extension FetchSolvedProblemDetailResponseDTO {
    func toDomain() -> SolvedProblemDetailEntity {
        SolvedProblemDetailEntity(
            solveId: solveId,
            solveTitle: solveTitle,
            solution: solution
        )
    }
}
