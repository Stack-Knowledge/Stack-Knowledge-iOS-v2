import Foundation

public struct FetchAllMissionResponseDTO: Decodable {
    public let missionId: String
    public let title: String
    public let point: Int
    public let missionStatus: MissionStatusType
    public let user: FetchUserInfoResponseDTO

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
            missionId: missionId,
            missionTitle: title,
            missionPoint: point,
            missionStatus: missionStatus,
            user: user.toDomain()
        )]
    }
}
