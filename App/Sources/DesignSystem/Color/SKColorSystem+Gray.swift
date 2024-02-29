import SwiftUI

public extension Color.SKColorSystem {
    // swiftlint:disable identifier_name
    enum Gray: SKColorable {
        case darkgray1
        case darkgary2
        case darkgray3
        case gray
        case lightgray1
        case lightgray2
    }
}

public extension Color.SKColorSystem.Gray {
    var color: Color {
        switch self {
        case .darkgray1: return StackKnowledgeAsset.Gray.darkgray1.swiftUIColor
        case .darkgary2: return StackKnowledgeAsset.Gray.darkgray2.swiftUIColor
        case .darkgray3: return StackKnowledgeAsset.Gray.darkgray3.swiftUIColor
        case .gray: return StackKnowledgeAsset.Gray.gray.swiftUIColor
        case .lightgray1: return StackKnowledgeAsset.Gray.lightgray1.swiftUIColor
        case .lightgray2: return StackKnowledgeAsset.Gray.lightgray2.swiftUIColor
        }
    }
}
