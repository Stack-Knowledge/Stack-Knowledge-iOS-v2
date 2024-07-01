import Foundation

public struct FetchItemResponseDTO: Decodable {
    public let itemID: String
    public let name: String
    public let price: Int
    public let image: String

    enum CodingKeys: String, CodingKey {
        case itemID = "itemId"
        case name
        case price
        case image
    }
}

extension FetchItemResponseDTO {
    func toDomainEntity() -> ItemEntity {
        ItemEntity(
            itemID: itemID,
            name: name,
            price: price,
            image: image
        )
    }

    func toDomainList() -> [ItemEntity] {
        [ItemEntity(
            itemID: itemID,
            name: name,
            price: price,
            image: image
        )]
    }
}
