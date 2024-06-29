import NeedleFoundation
import Service

public extension AppComponent {
    var remoteSolveDataSource: any RemoteSolveDataSource {
        shared {
            RemoteSolveDataSourceImpl()
        }
    }

    var solveRepository: any SolveRepository {
        shared {
            SolveRepositoryImpl(remoteSolveDataSource: remoteSolveDataSource)
        }
    }

    var solvedProblemUseCase: any SolvedProblemUseCase {
        shared {
            SolvedProblemUseCaseImpl(solveRepository: solveRepository)
        }
    }
}
