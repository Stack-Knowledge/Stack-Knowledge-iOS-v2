import Foundation

final class SampleIntent {
    private weak var model: SampleModelActionsProtocol?
    
    init(model: SampleModelActionsProtocol) {
        self.model = model
    }
    
    func buttonDidTap() {
        model?.buttonDidTap()
    }
}
