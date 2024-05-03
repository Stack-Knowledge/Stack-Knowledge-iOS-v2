import Foundation

public struct FetchMissionDetailResponseDTO: Decodable {
    public let title: String
    public let content: String
    public let timeLimit: Int
}

extension FetchMissionDetailResponseDTO {
    func toDomain() -> MissionDetailEntity {
        MissionDetailEntity(
            missionTitle: title,
            missionContent: content,
            timeLimit: timeLimit
        )
    }
}
