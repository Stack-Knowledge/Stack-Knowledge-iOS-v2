

import NeedleFoundation
import Service
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class SampleDependency1b18b455a8384602db39Provider: SampleDependency {


    init() {

    }
}
/// ^->AppComponent->SampleComponent
private func factoryd2c67a11371931c5d6bfe3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SampleDependency1b18b455a8384602db39Provider()
}

#else
extension AppComponent: Registration {
    public func registerItems() {

        localTable["remoteSolveDataSource-any RemoteSolveDataSource"] = { [unowned self] in self.remoteSolveDataSource as Any }
        localTable["solveRepository-any SolveRepository"] = { [unowned self] in self.solveRepository as Any }
        localTable["solvedProblemUseCase-any SolvedProblemUseCase"] = { [unowned self] in self.solvedProblemUseCase as Any }
        localTable["remoteAuthDataSource-any RemoteAuthDataSource"] = { [unowned self] in self.remoteAuthDataSource as Any }
        localTable["authRepository-any AuthRepository"] = { [unowned self] in self.authRepository as Any }
        localTable["loginByStudentUseCase-any LoginByStudentUseCase"] = { [unowned self] in self.loginByStudentUseCase as Any }
        localTable["loginByTeacherUseCase-any LoginByTeacherUseCase"] = { [unowned self] in self.loginByTeacherUseCase as Any }
        localTable["refreshUseCase-any RefreshUseCase"] = { [unowned self] in self.refreshUseCase as Any }
        localTable["logoutUseCase-any LogoutUseCase"] = { [unowned self] in self.logoutUseCase as Any }
        localTable["remoteUserDataSource-any RemoteUserDataSource"] = { [unowned self] in self.remoteUserDataSource as Any }
        localTable["userRepository-any UserRepository"] = { [unowned self] in self.userRepository as Any }
        localTable["fetchSolvedProblemListUseCase-any FetchSolvedProblemListUseCase"] = { [unowned self] in self.fetchSolvedProblemListUseCase as Any }
        localTable["fetchSolvedProblemDetailUseCase-any FetchSolvedProblemDetailUseCase"] = { [unowned self] in self.fetchSolvedProblemDetailUseCase as Any }
        localTable["fetchRequestedSignupTeacherListUsecase-any FetchRequestedSignupTeacherListUseCase"] = { [unowned self] in self.fetchRequestedSignupTeacherListUsecase as Any }
        localTable["markingProblemUseCase-any MarkingProblemUseCase"] = { [unowned self] in self.markingProblemUseCase as Any }
        localTable["repliedSignupUseCase-any RepliedSignupUseCase"] = { [unowned self] in self.repliedSignupUseCase as Any }
        localTable["sampleFactory-any SampleFactory"] = { [unowned self] in self.sampleFactory as Any }
        localTable["remoteMissionDataSource-any RemoteMissionDataSource"] = { [unowned self] in self.remoteMissionDataSource as Any }
        localTable["missionRepository-any MissionRepository"] = { [unowned self] in self.missionRepository as Any }
        localTable["fetchAllMissionUseCase-any FetchAllMissionUseCase"] = { [unowned self] in self.fetchAllMissionUseCase as Any }
        localTable["fetchMissionDetailUseCase-any FetchMissionDetailUseCase"] = { [unowned self] in self.fetchMissionDetailUseCase as Any }
        localTable["createMissionUseCase-any CreateMissionUseCase"] = { [unowned self] in self.createMissionUseCase as Any }
    }
}
extension SampleComponent: Registration {
    public func registerItems() {

    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->AppComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppComponent->SampleComponent", factoryd2c67a11371931c5d6bfe3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
