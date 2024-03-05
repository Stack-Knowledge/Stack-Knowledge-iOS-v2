import SwiftUI

public extension Color.SKColorSystem {
    // swiftlint:disable identifier_name
    enum Main: SKColorable {
        case mainColor
    }
}

public extension Color.SKColorSystem.Main {
    var color: Color {
        switch self {
        case .mainColor: return StackKnowledgeAsset.Main.mainColor.swiftUIColor
        }
    }
}
