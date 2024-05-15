import NeedleFoundation
import Service

public extension AppComponent {
    var remoteStudentDataSource: any RemoteStudentDataSource {
        shared {
            RemoteStudentDataSourceImpl()
        }
    }

    var studentRepository: any StudentRepository {
        shared {
            StudentRepositoryImpl(remoteStudentDataSource: remoteStudentDataSource)
        }
    }

    var fetchPointRankingListUseCase: any FetchPointRankingListUseCase {
        shared {
            FetchPointRankingListUseCaseImpl(studentRepository: studentRepository)
        }
    }

    var fetchMyInfoUseCase: any FetchMyInfoUseCase {
        shared {
            FetchMyInfoUseCaseImpl(studentRepository: studentRepository)
        }
    }

    var profileImageUploadUseCase: any ProfileImageUploadUseCase {
        shared {
            ProfileImageUploadUseCaseImpl(studentRepository: studentRepository)
        }
    }
}
