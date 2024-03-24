import SwiftUI

public protocol AdminTabBarFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
