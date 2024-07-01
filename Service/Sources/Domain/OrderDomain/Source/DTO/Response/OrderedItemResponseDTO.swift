import Foundation

public struct OrderedItemResponseDTO: Decodable {
    public let id: String
    public let count: Int
    public let price: Int
    public let item: FetchItemResponseDTO
    public let user: FetchUserInfoResponseDTO
}

extension OrderedItemResponseDTO {
    func toDomain() -> [OrderedItemEntity] {
        [OrderedItemEntity(
            itemID: id,
            count: count,
            price: price,
            item: item.toDomainEntity(),
            user: user.toDomain()
        )]
    }
}
