import Foundation

public protocol RemoteItemDataSource {
    func fetchItemList() async throws -> [ItemEntity]
}
