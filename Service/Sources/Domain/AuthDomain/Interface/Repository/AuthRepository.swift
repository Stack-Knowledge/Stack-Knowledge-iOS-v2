import Foundation

public protocol AuthRepository {
    func loginByStudent(code: String) async throws
    func loginByTeacher(code: String) async throws
    func refresh() async throws
    func logout() async throws
}
