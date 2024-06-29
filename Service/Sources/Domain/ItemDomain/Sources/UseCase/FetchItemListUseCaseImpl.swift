import Foundation

public struct FetchItemListUseCaseImpl: FetchItemListUseCase {
    private let itemRepository: any ItemRepository

    public init(itemRepository: any ItemRepository) {
        self.itemRepository = itemRepository
    }

    public func callAsFunction() async throws -> [ItemEntity] {
        try await itemRepository.fetchItemList()
    }
}
