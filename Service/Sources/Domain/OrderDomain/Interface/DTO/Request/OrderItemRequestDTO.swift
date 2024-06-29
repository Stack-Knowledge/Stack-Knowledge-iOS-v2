import Foundation

public struct OrderItemRequestDTO: Encodable {
    public let itemID: String
    public let count: Int

    enum CodingKeys: String, CodingKey {
        case itemID = "itemId"
        case count
    }
}
