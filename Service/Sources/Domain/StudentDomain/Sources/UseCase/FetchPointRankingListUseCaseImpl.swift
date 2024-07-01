import Foundation

public struct FetchPointRankingListUseCaseImpl: FetchPointRankingListUseCase {
    private let studentRepository: any StudentRepository

    public init(studentRepository: any StudentRepository) {
        self.studentRepository = studentRepository
    }

    public func callAsFunction() async throws -> [PointRankingListEntity] {
        try await studentRepository.fetchPointRankingList()
    }
}
