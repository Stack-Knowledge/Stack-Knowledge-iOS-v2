import Foundation

public struct FetchPointRankingListResponseDTO: Decodable {
    public let cumulatePoint: Int
    public let user: FetchUserInfoResponseDTO
}

extension FetchPointRankingListResponseDTO {
    func toDomain() -> [PointRankingListEntity] {
        [PointRankingListEntity(
            cumulatePoint: self.cumulatePoint,
            user: self.user.toDomain()
        )]
    }
}
