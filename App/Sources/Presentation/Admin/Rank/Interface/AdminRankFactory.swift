import SwiftUI

public protocol AdminRankFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
