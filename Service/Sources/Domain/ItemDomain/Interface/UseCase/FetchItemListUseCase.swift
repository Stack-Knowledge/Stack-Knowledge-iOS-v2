import Foundation

public protocol FetchItemListUseCase {
    func callAsFunction() async throws -> [ItemEntity]
}
