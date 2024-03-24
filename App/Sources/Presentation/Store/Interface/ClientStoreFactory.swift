import SwiftUI

public protocol ClientStoreFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
