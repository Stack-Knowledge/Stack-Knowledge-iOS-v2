import Foundation

import Alamofire

public struct RemoteStudentDataSourceImpl: RemoteStudentDataSource {
    public init() {}

    public func fetchPointRankingList() async throws -> [PointRankingListEntity] {
        try await API.session.request(StudentTarget.fetchPointRankingList, interceptor: AuthInterceptor())
            .serializingDecodable(FetchPointRankingListResponseDTO.self).value.toDomain()
    }
    
    public func fetchMyInfo() async throws -> MyInfoEntity {
        try await API.session.request(StudentTarget.fetchMyInfo, interceptor: AuthInterceptor())
            .serializingDecodable(FetchMyInfoResponseDTO.self).value.toDomain()
    }
    
    public func profileImageUpload(image: Data) async throws -> String {
        try await API.session.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(image, withName: "profileImg")
        }, with: StudentTarget.profileImageUpload(image: image)).serializingString().value
    }
}
