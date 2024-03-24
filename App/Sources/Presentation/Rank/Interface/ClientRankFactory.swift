import SwiftUI

public protocol ClientRankFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
