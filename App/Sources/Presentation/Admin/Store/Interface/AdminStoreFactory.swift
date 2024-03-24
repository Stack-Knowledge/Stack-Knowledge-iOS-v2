import SwiftUI

public protocol AdminStoreFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
