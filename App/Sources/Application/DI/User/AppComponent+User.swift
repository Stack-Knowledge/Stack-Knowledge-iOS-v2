import NeedleFoundation
import Service

public extension AppComponent {
    var remoteUserDataSource: any RemoteUserDataSource {
        shared {
            RemoteUserDataSourceImpl()
        }
    }

    var userRepository: any UserRepository {
        shared {
            UserRepositoryImpl(remoteUserDatasource: remoteUserDataSource)
        }
    }

    var fetchSolvedProblemListUseCase: any FetchSolvedProblemListUseCase {
        shared {
            FetchSolvedProblemListUseCaseImpl(userRepository: userRepository)
        }
    }

    var fetchSolvedProblemDetailUseCase: any FetchSolvedProblemDetailUseCase {
        shared {
            FetchSolvedProblemDetailUseCaseImpl(userRepository: userRepository)
        }
    }

    var fetchRequestedSignupTeacherListUsecase: any FetchRequestedSignupTeacherListUseCase {
        shared {
            FetchRequestedSignupTeacherListUseCaseImpl(userRepository: userRepository)
        }
    }

    var markingProblemUseCase: any MarkingProblemUseCase {
        shared {
            MarkingProblemUseCaseImpl(userRepository: userRepository)
        }
    }

    var repliedSignupUseCase: any RepliedSignupUseCase {
        shared {
            RepliedSignupUseCaseImpl(userRepository: userRepository)
        }
    }
}
