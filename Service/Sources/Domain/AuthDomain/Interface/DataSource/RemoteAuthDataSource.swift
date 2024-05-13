import Foundation

public protocol RemoteAuthDataSource {
    func loginByStudent(code: String) async throws
    func loginByTeacher(code: String) async throws
    func refresh() async throws
    func logout() async throws
}
