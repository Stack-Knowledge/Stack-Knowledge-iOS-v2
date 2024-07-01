import Foundation

public struct OrderedItemEntity: Equatable {
    public let itemID: String
    public let count: Int
    public let price: Int
    public let item: ItemEntity
    public let user: UserInfoEntity
}
