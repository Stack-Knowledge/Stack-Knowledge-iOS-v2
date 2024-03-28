import SwiftUI

public protocol StudentStoreFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
