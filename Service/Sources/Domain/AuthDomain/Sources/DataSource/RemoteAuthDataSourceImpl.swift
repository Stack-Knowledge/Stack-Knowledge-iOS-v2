import Foundation

import Alamofire

public struct RemoteAuthDataSourceImpl: RemoteAuthDataSource {
    public init() {}

    public func loginByStudent(code: String) async throws {
        _ = try await API.session.request(AuthTarget.loginByStudent(code: code), interceptor: AuthInterceptor())
            .serializingString().value
    }

    public func loginByTeacher(code: String) async throws {
        _ = try await API.session.request(AuthTarget.loginByTeacher(code: code), interceptor: AuthInterceptor())
            .serializingString().value
    }

    public func refresh() async throws {
        _ = try await API.session.request(AuthTarget.refresh, interceptor: AuthInterceptor())
            .serializingString().value
    }

    public func logout() async throws {
        _ = try await API.session.request(AuthTarget.logout, interceptor: AuthInterceptor())
            .serializingString().value
    }
}
