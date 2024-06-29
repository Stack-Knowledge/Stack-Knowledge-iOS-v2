import SwiftUI

public extension View {
    func skFont(
        _ style: Font.SKRFontSystem,
        color: Color.SKColorSystem
    ) -> some View {
        font(.sk(style))
            .foregroundColor(.sk(color))
    }

    func skFont(
        _ style: Font.SKRFontSystem
    ) -> some View {
        font(.sk(style))
    }
}

public extension Font {
    enum SKRFontSystem: SKFontable {
        case r18
        case r24
        case rm24
    }

    static func sk(_ style: SKRFontSystem) -> Font {
        return style.font
    }
}

public extension Font.SKRFontSystem {
    var font: Font {
        switch self {
        case .r18:
            return Font(StackKnowledgeFontFamily.Roboto.black.font(size: 18))

        case .r24:
            return Font(StackKnowledgeFontFamily.Roboto.black.font(size: 24))

        case .rm24:
            return Font(StackKnowledgeFontFamily.Roboto.medium.font(size: 14))
        }
    }
}
