import Foundation

protocol SampleModelStateProtocol {
    var text: String { get }
    var buttonState: Bool { get }
}

protocol SampleModelActionsProtocol: AnyObject {
    func buttonDidTap()
}
