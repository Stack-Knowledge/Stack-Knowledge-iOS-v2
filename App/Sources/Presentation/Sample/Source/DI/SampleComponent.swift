import NeedleFoundation
import Service
import SwiftUI

public protocol SampleDependency: Dependency {}

public final class SampleComponent: Component<SampleDependency>, SampleFactory {
    public func makeView() -> some View {
        let model = SampleModel()
        let intent = SampleIntent(model: model)

        let container = MVIContainer(
            intent: intent,
            model: model as SampleModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )

        return SampleView(container: container)
    }
}
