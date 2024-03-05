import SwiftUI

public extension View {
    func skAlert(
        title: String,
        isShowing: Binding<Bool>,
        alertActions: [SKAlertButtonType]
    ) -> some View {
        modifier(
            SKAlertModifier(
                title: title,
                isShowing: isShowing,
                alertActions: alertActions
            )
        )
    }
}

struct SKAlertModifier: ViewModifier {
    var title: String
    @Binding var isShowing: Bool
    var alertActions: [SKAlertButtonType]

    public init(
        title: String,
        isShowing: Binding<Bool>,
        alertActions: [SKAlertButtonType]
    ) {
        self.title = title
        _isShowing = isShowing
        self.alertActions = alertActions
    }

    func body(content: Content) -> some View {
        ZStack {
            content

            ConditionView(isShowing) {
                Color.sk(.gray(.darkgray3))
                    .opacity(0.25)
                    .ignoresSafeArea()

                skAlert()
                    .padding(40)
                    .transition(
                        .asymmetric(
                            insertion: AnyTransition.move(edge: .bottom),
                            removal: .move(edge: .bottom).combined(with: .opacity)
                        )
                    )
            }
        }
        .animation(.spring(response: 0.3, dampingFraction: isShowing ? 0.7 : 0.6, blendDuration: 40), value: isShowing)
    }

    @ViewBuilder
    func skAlert() -> some View {
        VStack(spacing: 36) {
            Text(title)
                .padding(.bottom, 36)
                .skFont(.r18)

            HStack(spacing: 16) {
                ForEach(alertActions, id: \.id) { button in
                    CTAButton(text: button.text, style: button.style, action: button.action)
                }
            }
        }
        .padding(14)
        .background(Color.white)
        .cornerRadius(20)
    }
}
