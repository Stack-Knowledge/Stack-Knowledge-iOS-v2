import Foundation

public struct ChangeItemStateRequestDTO: Encodable {
    public let orderID: String
    public let count: Int

    enum CodingKeys: String, CodingKey {
        case orderID = "orderId"
        case count
    }
}
