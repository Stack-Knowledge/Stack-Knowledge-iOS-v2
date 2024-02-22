import Foundation

final class SampleModel: ObservableObject, SampleModelStateProtocol {
    @Published var text: String = ""
    @Published var buttonState: Bool = false
}

extension SampleModel: SampleModelActionsProtocol {
    func buttonDidTap() {
        buttonState = true
        text = "buttonTap!!"
    }
}
