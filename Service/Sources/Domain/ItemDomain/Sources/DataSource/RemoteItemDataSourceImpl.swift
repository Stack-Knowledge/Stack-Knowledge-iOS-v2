import Foundation

public struct RemoteItemDataSourceImpl: RemoteItemDataSource {
    public init() {}

    public func fetchItemList() async throws -> [ItemEntity] {
        try await API.session.request(ItemTarget.fetchItemList, interceptor: AuthInterceptor()).serializingDecodable(FetchItemListResponseDTO.self).value.toDomain()
    }
}
