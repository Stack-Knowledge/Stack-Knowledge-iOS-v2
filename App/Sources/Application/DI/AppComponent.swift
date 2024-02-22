import NeedleFoundation
import Service
import SwiftUI

public final class AppComponent: BootstrapComponent {
    
}

public extension AppComponent {
    var sampleFactory: any SampleFactory {
        SampleComponent(parent: self)
    }
}
