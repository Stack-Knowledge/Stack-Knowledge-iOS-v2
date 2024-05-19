import Foundation

public protocol RemoteStudentDataSource {
    func fetchPointRankingList() async throws -> [PointRankingListEntity]
    func fetchMyInfo() async throws -> MyInfoEntity
    func profileImageUpload(image: Data) async throws -> String
}
