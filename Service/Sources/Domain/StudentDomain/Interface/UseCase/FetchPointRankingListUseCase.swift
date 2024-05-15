import Foundation

public protocol FetchPointRankingListUseCase {
    func callAsFunction() async throws -> [PointRankingListEntity]
}
