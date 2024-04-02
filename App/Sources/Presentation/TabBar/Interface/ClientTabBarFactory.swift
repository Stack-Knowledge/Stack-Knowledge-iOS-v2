import SwiftUI

public protocol ClientTabBarFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
