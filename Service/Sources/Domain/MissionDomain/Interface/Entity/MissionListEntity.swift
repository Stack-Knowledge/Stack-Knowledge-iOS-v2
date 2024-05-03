import Foundation

public struct MissionListEntity: Equatable {
    public let missionId: String
    public let missionTitle: String
    public let missionPoint: Int
    public let missionStatus: MissionStatusType
    public let user: UserInfoEntity

    public init(
        missionId: String,
        missionTitle: String,
        missionPoint: Int,
        missionStatus: MissionStatusType,
        user: UserInfoEntity
    ) {
        self.missionId = missionId
        self.missionTitle = missionTitle
        self.missionPoint = missionPoint
        self.missionStatus = missionStatus
        self.user = user
    }
}

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
