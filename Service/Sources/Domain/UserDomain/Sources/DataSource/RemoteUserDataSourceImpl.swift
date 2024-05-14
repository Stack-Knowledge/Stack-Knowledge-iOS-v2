import Foundation

import Alamofire

public struct RemoteUserDataSourceImpl: RemoteUserDataSource {
    public init() {}

    public func fetchSolvedProblemList() async throws -> [SolvedProblemListEntity] {
        try await API.session.request(UserTarget.fetchSolvedProblemList, interceptor: AuthInterceptor())
            .serializingDecodable(FetchSolvedProblemListResponseDTO.self)
            .value.toDomain()
    }
    
    public func fetchSolvedProblemDetail(solveId: String) async throws -> SolvedProblemDetailEntity {
        try await API.session.request(UserTarget.fetchSolvedProblemDetail(solveId: solveId), interceptor: AuthInterceptor())
            .serializingDecodable(FetchSolvedProblemDetailResponseDTO.self)
            .value.toDomain()
    }
    
    public func fetchRequestedSignupTeacherList() async throws -> [RequestedSignupTeacherListEntity] {
        try await API.session.request(UserTarget.fetchRequestedSignupTeacherList, interceptor: AuthInterceptor())
            .serializingDecodable(FetchRequestedSignupTeacherListResponseDTO.self)
            .value.toDomain()
    }
    
    public func markingProblem(solveId: String, approveStatus: ApproveStatusType) async throws {
        _ = try await API.session.request(UserTarget.markingProblem(solveId: solveId, approveStatus: approveStatus), interceptor: AuthInterceptor()).serializingString().value
    }
    
    public func repliedSignup(userId: String, approveStatus: ApproveStatusType) async throws {
        _ = try await API.session.request(UserTarget.repliedSignup(userId: userId, approveStatus: approveStatus), interceptor: AuthInterceptor()).serializingString().value
    }
}
