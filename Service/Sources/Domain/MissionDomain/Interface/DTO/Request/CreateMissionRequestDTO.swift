import Foundation

public struct CreateMissionRequestDTO: Encodable {
    public let title: String
    public let content: String
    public let timeLimit: Int

    public init(
        title: String,
        content: String,
        timeLimit: Int
    ) {
        self.title = title
        self.content = content
        self.timeLimit = timeLimit
    }
}
