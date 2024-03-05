import SwiftUI

public extension CTAButton {
    enum CTAStyle {
        case outline
        case `default`
    }
}

public struct CTAButtonStyle: ButtonStyle {
    var style: CTAButton.CTAStyle

    public func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .outline:
            OutlineButton(configuration: configuration)

        case .default:
            DefaultButton(configuration: configuration)
        }
    }
}

extension CTAButtonStyle {
    struct DefaultButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) var isEnabled
        var foregroundColor: Color {
            isEnabled ? .white : .sk(.gray(.lightgray1))
        }
        
        var body: some View {
            configuration.label
                .skFont(.pm20)
                .foregroundColor(foregroundColor)
                .background(Color.sk(.main(.mainColor)))
                .cornerRadius(8)
        }
    }
}

extension CTAButtonStyle {
    struct OutlineButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) var isEnabled
        var strokeColor: Color {
            isEnabled ? .sk(.main(.mainColor)) : .clear
        }

        var body: some View {
            configuration.label
                .skFont(.p16)
                .foregroundColor(Color.sk(.main(.mainColor)))
                .background(Color.white)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(strokeColor, lineWidth: 1)
                }
        }
    }
}
