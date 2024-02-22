import SwiftUI

public protocol SampleFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
