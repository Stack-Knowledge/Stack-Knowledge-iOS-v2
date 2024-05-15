import Foundation

public protocol ProfileImageUploadUseCase {
    func callAsFunction(image: Data) async throws -> String
}
