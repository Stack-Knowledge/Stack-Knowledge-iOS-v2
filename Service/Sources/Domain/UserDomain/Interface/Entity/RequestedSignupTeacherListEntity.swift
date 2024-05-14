import Foundation

public struct RequestedSignupTeacherListEntity: Equatable {
    public let teacherId: String
    public let teacherName: String
    public let createdAt: Date

    public init(
        teacherId: String,
        teacherName: String,
        createdAt: Date
    ) {
        self.teacherId = teacherId
        self.teacherName = teacherName
        self.createdAt = createdAt
    }
}
