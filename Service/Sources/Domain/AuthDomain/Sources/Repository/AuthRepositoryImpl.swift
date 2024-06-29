import Foundation

public struct AuthRepositoryImpl: AuthRepository {
    private let remoteAuthDataSource: any RemoteAuthDataSource

    public init(remoteAuthDataSource: any RemoteAuthDataSource) {
        self.remoteAuthDataSource = remoteAuthDataSource
    }

    public func loginByStudent(code: String) async throws {
        try await remoteAuthDataSource.loginByStudent(code: code)
    }

    public func loginByTeacher(code: String) async throws {
        try await remoteAuthDataSource.loginByTeacher(code: code)
    }

    public func refresh() async throws {
        try await remoteAuthDataSource.refresh()
    }

    public func logout() async throws {
        try await remoteAuthDataSource.logout()
    }
}
