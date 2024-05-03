import Foundation

public struct FetchAllMissionResponseDTO: Decodable {
    public let missionId: String
    public let title: String
    public let point: Int
    public let missionStatus: MissionStatusType
    public let user: UserInfoResponseDTO

    public struct UserInfoResponseDTO: Decodable {
        public let userId: String
        public let name: String
        public let profileImage: String

        enum CodingKeys: String, CodingKey {
            case userId = "id"
            case name
            case profileImage
        }
    }

    enum CodingKeys: String, CodingKey {
        case missionId = "id"
        case title
        case point
        case missionStatus
        case user
    }
}

extension FetchAllMissionResponseDTO {
    func toDomain() -> [MissionListEntity] {
        [MissionListEntity(
            missionId: self.missionId,
            missionTitle: self.title,
            missionPoint: self.point,
            missionStatus: self.missionStatus,
            user: self.user.toDomain()
        )]
    }
}

extension FetchAllMissionResponseDTO.UserInfoResponseDTO {
    func toDomain() -> UserInfoEntity {
        UserInfoEntity(
            userId: userId,
            userName: name,
            profileImage: profileImage
        )
    }
}
