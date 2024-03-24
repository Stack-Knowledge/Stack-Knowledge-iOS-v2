import SwiftUI

public protocol AdminMainFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
