import Foundation

public struct UserInfoEntity: Equatable {
    public let userId: String
    public let userName: String
    public let profileImage: String

    public init(
        userId: String,
        userName: String,
        profileImage: String
    ) {
        self.userId = userId
        self.userName = userName
        self.profileImage = profileImage
    }
}

