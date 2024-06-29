import Foundation

public protocol ItemRepository {
    func fetchItemList() async throws -> [ItemEntity]
}
