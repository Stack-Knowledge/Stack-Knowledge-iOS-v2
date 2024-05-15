import Foundation

public struct PointRankingListEntity: Equatable {
    public let cumulatePoint: Int
    public let user: UserInfoEntity

    public init(
        cumulatePoint: Int,
        user: UserInfoEntity
    ) {
        self.cumulatePoint = cumulatePoint
        self.user = user
    }
}
