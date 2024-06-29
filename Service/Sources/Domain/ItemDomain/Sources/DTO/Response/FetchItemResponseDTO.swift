import Foundation

public struct FetchItemListResponseDTO: Decodable {
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

extension FetchItemListResponseDTO {
    func toDomain() -> [ItemEntity] {
        [ItemEntity(
            itemID: self.itemID,
            name: self.name,
            price: self.price,
            image: self.image
        )]
    }
}
