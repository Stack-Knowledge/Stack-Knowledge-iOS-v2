import NeedleFoundation
import Service

public extension AppComponent {
    var remoteAuthDataSource: any RemoteAuthDataSource {
        shared {
            RemoteAuthDataSourceImpl()
        }
    }

    var authRepository: any AuthRepository {
        shared {
            AuthRepositoryImpl(remoteAuthDataSource: remoteAuthDataSource)
        }
    }

    var loginByStudentUseCase: any LoginByStudentUseCase {
        shared {
            LoginByStudentUseCaseImpl(authRepository: authRepository)
        }
    }

    var loginByTeacherUseCase: any LoginByTeacherUseCase {
        shared {
            LoginByTeacherUseCaseImpl(authRepository: authRepository)
        }
    }

    var refreshUseCase: any RefreshUseCase {
        shared {
            RefreshUseCaseImpl(authRepository: authRepository)
        }
    }

    var logoutUseCase: any LogoutUseCase {
        shared {
            LogoutUseCaseImpl(authRepository: authRepository)
        }
    }
}
