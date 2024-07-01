import Foundation

public protocol FetchOrderedItemUseCase {
    func callAsFunction() async throws -> [OrderedItemEntity]
}
