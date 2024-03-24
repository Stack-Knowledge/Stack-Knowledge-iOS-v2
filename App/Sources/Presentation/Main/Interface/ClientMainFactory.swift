import SwiftUI

public protocol ClientMainFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
