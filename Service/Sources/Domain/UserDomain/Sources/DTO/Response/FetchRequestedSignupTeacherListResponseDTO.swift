import Foundation

public struct FetchRequestedSignupTeacherListResponseDTO: Decodable {
    public let teacherId: String
    public let teacherName: String
    public let createdAt: Date

    enum CodingKeys: String, CodingKey {
        case teacherId
        case teacherName = "name"
        case createdAt
    }
}

extension FetchRequestedSignupTeacherListResponseDTO {
    func toDomain() -> [RequestedSignupTeacherListEntity] {
        [RequestedSignupTeacherListEntity(
            teacherId: teacherId,
            teacherName: teacherName,
            createdAt: createdAt
        )]
    }
}
