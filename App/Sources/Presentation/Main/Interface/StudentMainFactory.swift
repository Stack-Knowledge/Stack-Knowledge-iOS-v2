import SwiftUI

public protocol StudentMainFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
