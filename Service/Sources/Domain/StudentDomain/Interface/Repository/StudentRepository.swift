import Foundation

public protocol StudentRepository {
    func fetchPointRankingList() async throws -> [PointRankingListEntity]
    func fetchMyInfo() async throws -> MyInfoEntity
    func profileImageUpload(image: Data) async throws -> String
}
