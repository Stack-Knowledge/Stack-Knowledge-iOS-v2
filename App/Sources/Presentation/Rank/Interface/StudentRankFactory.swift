import SwiftUI

public protocol StudentRankFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
