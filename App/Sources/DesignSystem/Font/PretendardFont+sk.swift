import SwiftUI

public extension View {
    func skFont(
        _ style: Font.SKPFontSystem,
        color: Color.SKColorSystem
    ) -> some View {
        self
            .font(.sk(style))
            .foregroundColor(.sk(color))
    }

    func skFont(
        _ style: Font.SKPFontSystem
    ) -> some View {
        self
            .font(.sk(style))
    }
}

public extension Font {
    enum SKPFontSystem: SKFontable {
        case p16
        case pr12
        case pr14
        case pr16
        case pm14
        case pm16
        case pm18
        case pm20
        case pm40
        case ps18
    }

    static func sk(_ style: SKPFontSystem) -> Font {
        return style.font
    }
}

public extension Font.SKPFontSystem {
    var font: Font {
        switch self {
        case .p16:
            return Font(StackKnowledgeFontFamily.Pretendard.black.font(size: 16))

        case .pr12:
            return Font(StackKnowledgeFontFamily.Pretendard.regular.font(size: 12))

        case .pr14:
            return Font(StackKnowledgeFontFamily.Pretendard.regular.font(size: 14))

        case .pr16:
            return Font(StackKnowledgeFontFamily.Pretendard.regular.font(size: 16))

        case .pm14:
            return Font(StackKnowledgeFontFamily.Pretendard.medium.font(size: 14))

        case .pm16:
            return Font(StackKnowledgeFontFamily.Pretendard.medium.font(size: 16))

        case .pm18:
            return Font(StackKnowledgeFontFamily.Pretendard.medium.font(size: 18))

        case .pm20:
            return Font(StackKnowledgeFontFamily.Pretendard.medium.font(size: 20))

        case .pm40:
            return Font(StackKnowledgeFontFamily.Pretendard.medium.font(size: 40))

        case .ps18:
            return Font(StackKnowledgeFontFamily.Pretendard.semiBold.font(size: 18))
        }
    }
}
