import Foundation

public struct FetchUserInfoResponseDTO: Decodable {
    public let userId: String
    public let name: String
    public let profileImage: String

    enum CodingKeys: String, CodingKey {
        case userId = "id"
        case name
        case profileImage
    }
}

extension FetchUserInfoResponseDTO {
    func toDomain() -> UserInfoEntity {
        UserInfoEntity(
            userId: userId,
            userName: name,
            profileImage: profileImage
        )
    }
}
