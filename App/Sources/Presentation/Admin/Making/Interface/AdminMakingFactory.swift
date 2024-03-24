import SwiftUI

public protocol AdminMakingFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
