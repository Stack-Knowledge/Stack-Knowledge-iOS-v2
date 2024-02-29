import SwiftUI

public extension View {
    func smsFont(
        _ style: Font.SMSFontSystem,
        color: Color.SKColorSystem
    ) -> some View {
        self
            .font(.sk(style))
            .foregroundColor(.sk(color))
    }

    func smsFont(
        _ style: Font.SMSFontSystem
    ) -> some View {
        self
            .font(.sk(style))
    }
}

public extension Font {
    enum SMSFontSystem: SKFontable {
        case P16
        case PR12
        case PR14
        case PR16
        case PM14
        case PM16
        case PM18
        case PM20
        case PM40
        case PS18
    }

    static func sk(_ style: SMSFontSystem) -> Font {
        return style.font
    }
}

public extension Font.SMSFontSystem {
    var font: Font {
        switch self {
        case .headline1:
            return Font(StackKnowledgeFontFamily.Pretendard.bold.font(size: 64))

        case .headline2:
            return Font(StackKnowledgeFontFamily.Pretendard.bold.font(size: 40))

        case .headline3:
            return Font(StackKnowledgeFontFamily.Pretendard.bold.font(size: 32))

        case .headline4:
            return Font(StackKnowledgeFontFamily.Pretendard.bold.font(size: 28))

        case .title1:
            return Font(StackKnowledgeFontFamily.Pretendard.bold.font(size: 20))

        case .title2:
            return Font(StackKnowledgeFontFamily.Pretendard.bold.font(size: 17))

        case .body1:
            return Font(StackKnowledgeFontFamily.Pretendard.regular.font(size: 15))

        case .body2:
            return Font(StackKnowledgeFontFamily.Pretendard.regular.font(size: 14))

        case .caption1:
            return Font(StackKnowledgeFontFamily.Pretendard.regular.font(size: 13))

        case .caption2:
            return Font(StackKnowledgeFontFamily.Pretendard.regular.font(size: 12))
        }
    }
}
