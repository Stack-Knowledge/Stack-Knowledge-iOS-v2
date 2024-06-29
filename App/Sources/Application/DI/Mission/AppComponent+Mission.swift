import NeedleFoundation
import Service

public extension AppComponent {
    var remoteMissionDataSource: any RemoteMissionDataSource {
        shared {
            RemoteMissionDataSourceImpl()
        }
    }

    var missionRepository: any MissionRepository {
        shared {
            MissionRepositoryImpl(remoteMissionDataSource: remoteMissionDataSource)
        }
    }

    var fetchAllMissionUseCase: any FetchAllMissionUseCase {
        shared {
            FetchAllMissionUseCaseImpl(missionRepository: missionRepository)
        }
    }

    var fetchMissionDetailUseCase: any FetchMissionDetailUseCase {
        shared {
            FetchMissionDetailUseCaseImpl(missionRepository: missionRepository)
        }
    }

    var createMissionUseCase: any CreateMissionUseCase {
        shared {
            CreateMissionUseCaseImpl(missionRepository: missionRepository)
        }
    }
}
