import Foundation

public struct StudentRepositoryImpl: StudentRepository {
    private let remoteStudentDataSource: any RemoteStudentDataSource

    public init(remoteStudentDataSource: any RemoteStudentDataSource) {
        self.remoteStudentDataSource = remoteStudentDataSource
    }

    public func fetchPointRankingList() async throws -> [PointRankingListEntity] {
        try await remoteStudentDataSource.fetchPointRankingList()
    }

    public func fetchMyInfo() async throws -> MyInfoEntity {
        try await remoteStudentDataSource.fetchMyInfo()
    }

    public func profileImageUpload(image: Data) async throws -> String {
        try await remoteStudentDataSource.profileImageUpload(image: image)
    }
}
