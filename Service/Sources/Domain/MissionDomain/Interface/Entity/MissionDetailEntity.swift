import Foundation

public struct MissionDetailEntity: Equatable {
    public let missionTitle: String
    public let missionContent: String
    public let timeLimit: Int

    public init(
        missionTitle: String,
        missionContent: String,
        timeLimit: Int
    ) {
        self.missionTitle = missionTitle
        self.missionContent = missionContent
        self.timeLimit = timeLimit
    }
}
