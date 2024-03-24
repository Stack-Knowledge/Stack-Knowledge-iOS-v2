import SwiftUI

public protocol AdminScoringFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
