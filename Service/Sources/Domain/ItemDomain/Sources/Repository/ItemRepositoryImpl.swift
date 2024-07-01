import Foundation

public struct ItemRepositoryImpl: ItemRepository {
    private let remoteItemDataSource: any RemoteItemDataSource

    public init(remoteItemDataSource: any RemoteItemDataSource) {
        self.remoteItemDataSource = remoteItemDataSource
    }

    public func fetchItemList() async throws -> [ItemEntity] {
        try await remoteItemDataSource.fetchItemList()
    }
}
